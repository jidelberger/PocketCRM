unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, cySpeedButton, cyEdit, cyLabel,
  cyBaseCombobox, TplShapeObjects, mwcrmdocument;

type

  { TForm1 }

  TForm1 = class(TForm)
    BtnContactEdit: TcySpeedButton;
    BtnSaveContact: TcySpeedButton;
    BtnCreateGroup: TcySpeedButton;
    BtnDeleteGroup: TcySpeedButton;
    CbGroup: TcyCombobox;
    cyLabel3: TcyLabel;
    cyLabel4: TcyLabel;
    cyLabel5: TcyLabel;
    cyLabel6: TcyLabel;
    cyLabel7: TcyLabel;
    cyLabel8: TcyLabel;
    BtnCreateContact: TcySpeedButton;
    cyLabel9: TcyLabel;
    EdtOrt: TcyEdit;
    EdtPhone: TcyEdit;
    EdtMail: TcyEdit;
    EdtVorname: TcyEdit;
    cyLabel1: TcyLabel;
    cyLabel2: TcyLabel;
    cySpeedButton1: TcySpeedButton;
    cySpeedButton2: TcySpeedButton;
    ContactsPanel: TPanel;
    EdtName: TcyEdit;
    EdtAdresse: TcyEdit;
    EdtPLZ: TcyEdit;
    EdtID: TcyEdit;
    LblTitel: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    HomePanel: TPanel;
    Indikator: TPanel;
    plLine1: TplLine;
    plLine2: TplLine;
    procedure AllesLeer();
    procedure BtnContactEditClick(Sender: TObject);
    procedure BtnCreateContactClick(Sender: TObject);
    procedure BtnSaveContactClick(Sender: TObject);
    procedure cySpeedButton1Click(Sender: TObject);
    procedure cySpeedButton2Click(Sender: TObject);
    procedure EdtAdresseChange(Sender: TObject);
    procedure EdtIDChange(Sender: TObject);
    procedure EdtMailChange(Sender: TObject);
    procedure EdtNameChange(Sender: TObject);
    procedure EdtOrtChange(Sender: TObject);
    procedure EdtPhoneChange(Sender: TObject);
    procedure EdtPLZChange(Sender: TObject);
    procedure EdtVornameChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuAktualisieren(Sender : TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ContactDoc : TCRMContactdoc;
  GroupDoc : TCRMGroupdoc;
  ContactNeu : Boolean;

implementation

{$R *.frm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  res : Boolean;
begin
  ContactDoc := TCRMContactdoc.Create();
  GroupDoc := TCRMGroupdoc.Create();
  Res := ContactDoc.CreateTable();
  if Res = true then
    Res := GroupDoc.CreateTable();
  ContactNeu := false;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  HomePanel.BringToFront;
  LblTitel.Caption:='Start';
end;

procedure TForm1.cySpeedButton1Click(Sender: TObject);
begin
  HomePanel.BringToFront;
  MenuAktualisieren(Sender);
end;

procedure TForm1.BtnCreateContactClick(Sender: TObject);

begin
  if ContactDoc.CheckID(StrToInt(EdtID.Text)) = false then
    begin
    ContactNeu := True;
    btnSaveContact.Enabled := True;
    end;
end;

procedure TForm1.BtnContactEditClick(Sender: TObject);
var
  Res : Boolean;
begin
  if ContactDoc.CheckID(StrToInt(EdtID.Text)) = True then
    begin
    ContactNeu := False;
    btnSaveContact.Enabled := True;
    Res := ContactDoc.FetchEntry(StrToInt(EdtID.Text));
    if Res = true then
      Begin
        EdtVorname.Text := ContactDoc.FirstName;
        EdtName.Text:= ContactDoc.LastName;
        EdtAdresse.Text:= ContactDoc.Adress;
        EdtPlz.Text := ContactDoc.PLZ;
        EdtOrt.Text:= ContactDoc.Ort;
        EdtPhone.Text:= ContactDoc.phone;
        EdtMail.Text:= Contactdoc.email;
      end;
    end;
end;

procedure TForm1.BtnSaveContactClick(Sender: TObject);
var
  Res : Boolean;
begin
  Res := false;
  if ContactNeu = true then
    Begin
      Res := ContactDoc.InsertEntry();
      if Res = false then
        ShowMessage('Fehler: Konnte nicht sichern');
      AllesLeer();
    end;
  if ContactNeu = false then
    Begin
      Res := ContactDoc.UpdateEntry();
      if Res = false then
        ShowMessage('Fehler: Konnte nicht sichern');
      AllesLeer();
    end;
  BtnSaveContact.Enabled := false;
  ContactNeu := false;
end;

procedure TForm1.cySpeedButton2Click(Sender: TObject);
begin
  ContactsPanel.BringToFront;
  MenuAktualisieren(Sender);
end;

procedure TForm1.EdtAdresseChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.Adress:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;

procedure TForm1.EdtIDChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.ID:=StrToInt(TcyEdit(Sender).Text);
  ContactDoc.Changed := true;
end;

procedure TForm1.EdtMailChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.Email:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;



procedure TForm1.EdtNameChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.LastName:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;

procedure TForm1.EdtOrtChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.Ort:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;

procedure TForm1.EdtPhoneChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.Phone:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;

procedure TForm1.EdtPLZChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.PLZ:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;

procedure TForm1.EdtVornameChange(Sender: TObject);
begin
  if TcyEdit(Sender).Text <> '' then
    ContactDoc.FirstName:=TcyEdit(Sender).Text;
  ContactDoc.Changed := true;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ContactDoc.Free;
  GroupDoc.Free;
end;

procedure TForm1.MenuAktualisieren(Sender: TObject);
Begin
  Indikator.Top := TcySpeedButton(Sender).Top;
  lblTitel.Caption := TcySpeedButton(Sender).Caption;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  cySpeedButton1Click(cySpeedButton1);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  cySpeedButton2Click(cySpeedButton2);
end;

procedure TForm1.AllesLeer();
Begin
  EdtID.Text := '';
  EdtVorname.Text := '';
  EdtName.Text := '';
  EdtAdresse.Text :='';
  EdtPLZ.Text:= '';
  EdtOrt.Text:= '';
  EdtPhone.Text:= '';
  EdtMail.Text := '' ;
end;

end.

