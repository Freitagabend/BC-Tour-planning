page 50100 "RouteViewer"
{
    ApplicationArea = All;
    Caption = 'Route Viewer';
    PageType = List;
    SourceTable = RouteStopBuffer;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Stops)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Stop Name"; Rec."Stop Name")
                {
                    ToolTip = 'Specifies the value of the Stop Name field.';
                }
                field("Distance (km)"; Rec."Distance (km)")
                {
                    ToolTip = 'Specifies the value of the Distance (km) field.';
                }
                field("Duration (min)"; Rec."Duration (min)")
                {
                    ToolTip = 'Specifies the value of the Duration (min) field.';
                }
                field("Google Maps Link"; Rec."Google Maps Link")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Google Maps Link field.';
                    trigger OnDrillDown()
                    begin
                        Hyperlink(Rec."Google Maps Link");
                    end;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}