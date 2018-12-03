pageextension 50101 "CSD ResourceListExt" extends "Resource List"
//CSD 1.001 20181203 DE Veloper
{
    layout
    {

    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()
    begin
        showtype := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(type) = format(type::Machine));
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        Showtype: Boolean;
}