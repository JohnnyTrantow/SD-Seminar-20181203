pageextension 50100 "CSD ResourceCardExt" extends "Resource Card"
//CSD 1.00 20181203 DE Voleloper
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Quantity Per Day"; "CSD Quantity Per Day")
            {

            }

        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxfield;
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {

                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    begin
        ShowMaxfield := (type = type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxfield: Boolean;

}