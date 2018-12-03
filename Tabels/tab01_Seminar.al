table 50101 "CSD Seminar"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar';

    fields
    {
        field(10; "No."; Code[20])
        {
            caption = '';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }


        field(20; "Name"; Text[50])
        {
            caption = 'Name';
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or
                ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;

        }
        field(40; "Minimum Participants"; Integer)
        {
            caption = 'Minimum Participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            caption = 'Maximum Participants';
        }
        field(60; "Search Name"; code[50])
        {
            caption = 'Search Name';
        }
        field(70; Blocked; Boolean)
        {
            caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            caption = 'Last Date Modified';
            Editable = false;
        }
        field(90; Comment; Boolean)
        {
            caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
            //CalcFormula = Exist("Seminar Comment Line" WHERE ("Table Name"=CONST("Seminar"),"No."=FIELD("No.")));
        }
        field(100; "Seminar Price"; Decimal)
        {
            caption = 'Seminar Price';
            AutoFormatType = 1;

        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate()
            begin
                if (xRec."Gen. Prod. Posting Group" <>
                "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                    (GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                        GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            caption = 'VAT. Prod. Posting Group';

        }
        field(130; "No. Series"; code[10])
        {
            caption = 'No. Series';
            TableRelation = "No. Series";

        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(key1; "Search Name")

        {

        }
    }
    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        VatProdPostingGroup: Record "VAT Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    
    begin
        "Last Date Modified" := today;

    end;

    trigger OnDelete()
    begin
        //CommentLine.Reset;
        //CommentLine.SetRange("Table Name",
        //CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        //CommentLine.DeleteAll;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := today;
    end;

    procedure AssisteEdit(): Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos."
            , xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;

}