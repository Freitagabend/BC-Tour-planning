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
                ToolTip = 'Executes the Route planen action.';
                Image = Route;

                trigger OnAction()
                var
                    CustomerRec: Record Customer;
                    Client: HttpClient;
                    HttpHeader: HttpHeaders;
                    Request: HttpRequestMessage;
                    Response: HttpResponseMessage;
                    Content: HttpContent;
                    JsonText: Text;
                    JsonTextLbl: Label '{ "stops": [%1], "optimize": true }', Locked = true, Comment = 'Label for JSON text';
                    AddressArrayLbl: Label '{"name": "%1 %2, %3 %4, %5"}', Locked = true, Comment = 'Label for address array';
                    AddressArray: Text;
                    ResponseText: Text;
                    IsFirst: Boolean;
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
