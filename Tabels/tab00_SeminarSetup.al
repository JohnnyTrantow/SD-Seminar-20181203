table 50100 "CSD Seminar Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Setup';
    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            caption = 'Primary Key';
        }
        field(20; "Seminar Nos."; Code[20])
        {
            caption = 'Seminar Nos.';
            TableRelation = "No. Series";
        }
        field(30; "Seminar Registration Nos."; Code[20])
        {
            caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";
        }
        field(40; "Posted Seminar Reg. Nos."; Code[20])
        {
            caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";
        }



    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}