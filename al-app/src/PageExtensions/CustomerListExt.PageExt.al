pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action(PlanRoute)
            {
                ApplicationArea = All;
                Caption = 'Route planen';
                Image = Route;
                ToolTip = 'Executes the Route planen action.';

                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                    IsFirst: Boolean;
                    Client: HttpClient;
                    Content: HttpContent;
                    HttpHeader: HttpHeaders;
                    Request: HttpRequestMessage;
                    Response: HttpResponseMessage;
                    AddressArrayLbl: Label '{"name": "%1 %2, %3 %4, %5"}', Locked = true, Comment = 'Label for address array';
                    JsonTextLbl: Label '{ "stops": [%1], "optimize": true }', Locked = true, Comment = 'Label for JSON text';
                    AddressArray: Text;
                    JsonText: Text;
                    ResponseText: Text;
                begin
                    AddressArray := '';
                    IsFirst := true;

                    if CustomerRec.FindSet() then
                        repeat
                            if CustomerRec."Country/Region Code" = '' then
                                CustomerRec."Country/Region Code" := 'DE'; // Fallback

                            if not IsFirst then
                                AddressArray += ','
                            else
                                IsFirst := false;

                            AddressArray += STRSUBSTNO(
                              AddressArrayLbl,
                              CustomerRec.Name,
                              CustomerRec.Address,
                              CustomerRec."Post Code",
                              CustomerRec.City,
                              CustomerRec."Country/Region Code"
                            );
                        until CustomerRec.Next() = 0;

                    JsonText := STRSUBSTNO(JsonTextLbl, AddressArray);

                    Request.Method := 'POST';
                    Request.SetRequestUri('https://dein-backend-url/route');
                    Content.WriteFrom(JsonText);

                    Content.GetHeaders(HttpHeader);

                    HttpHeader.Add('Content-Type', 'application/json');
                    Request.Content := Content;

                    Client.Send(Request, Response);

                    if Response.IsSuccessStatusCode() then begin
                        Response.Content().ReadAs(ResponseText);
                        Message('Optimierte Route empfangen:\%1', ResponseText);
                    end else
                        Error('Fehler vom Backend: %1', Response.HttpStatusCode());
                end;
            }
        }
    }
}
