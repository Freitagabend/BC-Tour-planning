table 50100 "RouteStopBuffer"
{
    Caption = 'RouteStopBuffer';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Line No."; Integer) { }
        field(2; "Stop Name"; Text[250]) { }
        field(3; Latitude; Decimal) { }
        field(4; Longitude; Decimal) { }
        field(5; "Distance (km)"; Decimal) { }
        field(6; "Duration (min)"; Decimal) { }
        field(7; "Google Maps Link"; Text[500]) { }
    }

    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

}