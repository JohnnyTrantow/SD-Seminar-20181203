tableextension 50100 "CSD ResourceExt" extends Resource
//CSD1.00 20181203 DE Veloper
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.TestField("Unit Cost");
            end;
        }

        modify(Type)
        {
            OptionCaption = 'Instructor,Room';

        }
        field(50101; "CSD Resource Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            Caption = 'Resource Type';
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maximum Participants';

        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            Caption = 'Quantity Per Day';
        }
    }

}