unit crtgroup;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, cyEdit,
  cyLabel;

type

  { TForm2 }

  TForm2 = class(TForm)
    BtnOK: TButton;
    BtnAbbruch: TButton;
    cyLabel1: TcyLabel;
    cyLabel2: TcyLabel;
    EdtID: TcyEdit;
    EdtName: TcyEdit;
    procedure BtnAbbruchClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public
    GrpID : Integer;
    GrpName : String;
  end;

var
  Form2: TForm2;

implementation

{$R *.frm}

{ TForm2 }

procedure TForm2.BtnAbbruchClick(Sender: TObject);
begin
  GrpID := 0;
  GrpName := '';
  Form2.Close;
end;

procedure TForm2.BtnOKClick(Sender: TObject);
begin
  GrpName := EdtName.Text;
  Form2.Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  EdtID.Text := IntToStr(GrpID);
end;

end.

