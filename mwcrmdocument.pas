unit mwcrmdocument;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,sqldb, sqlite3conn, db;

function slash(value:string):string;
function getinstalldir:string;
function getbasedir:string;

type
  // Kontakte
  TCRMContactdoc = Class(TObject)
    public
    ID : Integer;
    FirstName : String;
    LastName : String;
    Adress : String;
    PLZ : String;
    Ort : String;
    email : String;
    phone : String;
    SQLString : String;
    Changed : Boolean;
    private
    AConnection : TSQLite3Connection;
    ATransaction : TSQLTransaction;
    AQuery : TSQLQuery;
    public
    Function CreateTable() : Boolean;
    Function InsertEntry() : Boolean;
    Function FetchEntry(ContactID : Integer) : Boolean;
    Function UpdateEntry() : Boolean;
    Function CheckID(CID : Integer) : Boolean;
  end;
  //Gruppen
  TCRMGroupdoc = Class(TObject)
    public
    GroupID : Integer;
    Name : String;
    SQLString : String;
    Changed : Boolean;
    private
    AConnection : TSQLite3Connection;
    ATransaction : TSQLTransaction;
    AQuery : TSQLQuery;
    public
    Function CreateTable() : Boolean;
    Function InsertEntry() : Boolean;
    Function NewContactAndGroup(NewContact : Integer; NewGroup :Integer) : Boolean;
    Function FetchEntry(GID : Integer) : Boolean;
    Function UpdateEntry(GID : Integer) : Boolean;
    Function CheckID(GID : Integer) : Boolean;
  end;

implementation

//Filehelper

function slash(value:string):string;
begin
if (value='') then result:=''
              else begin
                   {$IFDEF WINDOWS}
                   if (value[length(value)]<>'\') then result:=value+'\'
                   {$ELSE}
                   if (value[length(value)]<>'/') then result:=value+'/'
                   {$ENDIF}
                                                  else result:=value;
                   end;
end;

function getinstalldir:string;
begin
result:=slash(extractfiledir(paramstr(0)));
end;

function getbasedir:string;
Begin
{$IFDEF WINDOWS}
result:=getinstalldir;
{$ELSE}
result:=copy(getinstalldir,1,pos(extractfilename(paramstr(0))+'.app/Contents/MacOS',getinstalldir)-1);
{$ENDIF}
end;


// Contacts

Function TCRMContactdoc.CreateTable() : Boolean;
var
  s : String;
Begin
  SQLString := 'CREATE TABLE IF NOT EXISTS contacts ( ' ;
  SQLString := SQLSTring + 'contact_id INTEGER PRIMARY KEY, ';
  SQLString := SQLSTring + 'first_name TEXT NOT NULL,  ';
  SQLString := SQLSTring + 'last_name TEXT NOT NULL,  ' ;
  SQLString := SQLSTring + 'adress TEXT NOT NULL, ' ;
  SQLString := SQLSTring + 'plz TEXT NOT NULL, ';
  SQLString := SQLSTring + 'ort TEXT NOT NULL, ';
  SQLString := SQLSTring + 'email TEXT NOT NULL UNIQUE, ';
  SQLString := SQLSTring + 'phone TEXT NOT NULL UNIQUE);';
  try
    AConnection := TSQLite3Connection.Create(nil);
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    AConnection.Open;
    ATransaction.StartTransaction;
    AConnection.ExecuteDirect(SQLString);

    ATransaction.Commit;
  finally
    AConnection.Close;
    ATransaction.Free;
    AConnection.Free;
  end;
  Changed := False;
  CreateTable := True;
end;

Function TCRMContactdoc.InsertEntry() : Boolean;
var
  s : String;
begin
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    SQLString := 'INSERT INTO contacts (';
    SQLString := SQLString + 'contact_id, first_name, last_name, adress, plz, ort, email, phone) ';
    SQLString := SQLString + 'values (:contact_id, :first_name, :last_name, :adress, :plz, :ort, :email, :phone);';
    AQuery := TSQLQuery.Create(nil);
    AQuery.Database := AConnection;
    AQuery.SQL.Text := SQLString;
    Aquery.Prepare;
    // Params holen
    AQuery.Params.ParamByName('contact_id').AsInteger := ID;
    AQuery.Params.ParamByName('first_name').AsString := FirstName;
    AQuery.Params.ParamByName('last_name').AsString := LastName;
    AQuery.Params.ParamByName('adress').AsString := Adress;
    AQuery.Params.ParamByName('plz').AsString := PLZ;
    AQuery.Params.ParamByName('ort').AsString := Ort;
    AQuery.Params.ParamByName('email').AsString := Email;
    AQuery.Params.ParamByName('phone').AsString := Phone;
    AQuery.ExecSQL;
    ATransaction.Commit;
  finally
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;
  InsertEntry := true;
end;

Function TCRMContactdoc.FetchEntry(ContactID : Integer) : Boolean;
var
  s : String;
begin
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    AQuery := TSQLQuery.Create(nil);
    AQuery.SQL.Text := 'SELECT * FROM contacts WHERE contact_id = '+IntToStr(ContactID);
    AQuery.Database := AConnection;
    AQuery.Open;
  finally
    ID := AQuery.FieldByName('contact_id').AsInteger;
    FirstName := AQuery.FieldByName('first_name').AsString;
    LastName := AQuery.FieldByName('last_name').AsString;
    Adress := AQuery.FieldByName('adress').AsString;
    PLZ := AQuery.FieldByName('plz').AsString;
    Ort := AQuery.FieldByName('ort').AsString;
    EMail := AQuery.FieldbyName('email').AsString;
    Phone := AQuery.FieldByName('phone').AsString;
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;

  FetchEntry := true;
end;

Function TCRMContactdoc.UpdateEntry() : Boolean;
var
  s : String;
Begin
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    AQuery := TSQLQuery.Create(nil);
    AQuery.DataBase := AConnection;
    AQuery.SQL.Text := 'select * from contacts where contact_id = ' + IntToStr(ID);
    AQuery.Open;
    AQuery.Edit;
    AQuery.FieldByName('contact_id').AsInteger := ID;
    AQuery.FieldByName('first_name').AsString := FirstName;
    AQuery.FieldByName('last_name').AsString := LastName;
    AQuery.FieldByName('adress').AsString := Adress;
    AQuery.FieldByName('plz').AsString := PLZ;
    AQuery.FieldByName('ort').AsString := Ort;
    AQuery.FieldbyName('email').AsString := EMail;
    AQuery.FieldByName('phone').AsString := Phone;
    AQuery.Post;
    AQuery.UpdateMode := upWhereAll;         // defined in db
    AQuery.ApplyUpdates;
    ATransaction.Commit;
  finally
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;
  Changed := false;
  UpdateEntry := True;
end;

Function TCRMContactdoc.CheckID(CID : Integer) : Boolean;
var
  s : string;
Begin
  SQLString := 'SELECT contact_id FROM contacts WHERE contact_id = ' + IntToStr(CID);
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    AQuery := TSQLQuery.Create(nil);
    AQuery.SQL.Text := SQLString;
    AQuery.Database := AConnection;
    AQuery.Open;
  finally
    if AQuery.RecordCount = 0 then
      CheckID := False
    else
      CheckID := True;
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;
end;

//Groupts
Function TCRMGroupdoc.CreateTable() : Boolean;
var
  s : String;
begin
  try
    SQLString:= 'CREATE TABLE IF NOT EXISTS groups (group_id INTEGER PRIMARY KEY, name TEXT NOT NULL);';
    AConnection := TSQLite3Connection.Create(nil);
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    AConnection.Open;
    ATransaction.StartTransaction;
    AConnection.ExecuteDirect(SQLString);
    ATransaction.Commit;
    SQLString := 'CREATE TABLE IF NOT EXISTS contact_groups(';
    SQLString := SQLString + ' contact_id INTEGER, group_id INTEGER,';
    SQLString := SQLString + 'PRIMARY KEY (contact_id, group_id), FOREIGN KEY (contact_id)';
    SQLString := SQLString + 'REFERENCES contacts (contact_id) ON DELETE CASCADE ON UPDATE NO ACTION,';
    SQLString := SQLString + 'FOREIGN KEY (group_id)  REFERENCES groups (group_id) ON DELETE CASCADE ON UPDATE NO ACTION);';
    ATransaction.StartTransaction;
    AConnection.ExecuteDirect(SQLString);
    ATransaction.Commit;
  finally
    AConnection.Close;
    ATransaction.Free;
    AConnection.Free;
  end;
  Changed := False;
  CreateTable := true;
end;

Function TCRMGroupdoc.InsertEntry() : Boolean;
var
  s : String;
begin
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    SQLString := 'INSERT INTO groups (';
    SQLString := SQLString + 'group_id, name) ';
    SQLString := SQLString + 'values (:goup_id, name);';
    AQuery := TSQLQuery.Create(nil);
    AQuery.Database := AConnection;
    AQuery.SQL.Text := SQLString;
    Aquery.Prepare;
    // Params holen
    AQuery.Params.ParamByName('group_id').AsInteger := GroupID;
    AQuery.Params.ParamByName('name').AsString := Name;
    AQuery.ExecSQL;
    ATransaction.Commit;
  finally
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;
  InsertEntry := true;
end;

Function TCRMGroupdoc.FetchEntry(GID : Integer) : Boolean;
var
  s : String;
begin
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    AQuery := TSQLQuery.Create(nil);
    AQuery.SQL.Text := 'SELECT * FROM groups WHERE group_id = '+IntToStr(GID);
    AQuery.Database := AConnection;
    AQuery.Open;
  finally
    GroupID := AQuery.FieldByName('contact_id').AsInteger;
    Name := AQuery.FieldByName('name').AsString;
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;

  FetchEntry := true;
end;

Function TCRMGroupdoc.UpdateEntry(gID : Integer) : Boolean;
var
  s : String;
Begin
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    AQuery := TSQLQuery.Create(nil);
    AQuery.DataBase := AConnection;
    AQuery.SQL.Text := 'select * from groups where group_id = ' + IntToStr(gID);
    AQuery.Open;
    AQuery.Edit;
    AQuery.FieldByName('name').AsString := Name;
    AQuery.Post;
    AQuery.UpdateMode := upWhereAll;         // defined in db
    AQuery.ApplyUpdates;
    ATransaction.Commit;
  finally
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;
  Changed := false;
  UpdateEntry := True;
end;

Function TCRMGroupdoc.CheckID(GID : Integer) : Boolean;
var
  s : string;
Begin
  SQLString := 'SELECT contact_id FROM contact_groups WHERE contact_id = ' + IntToStr(GID);
  try
    AConnection := TSQLite3Connection.Create(nil);
    ATransaction := TSQLTransaction.Create(AConnection);
    AConnection.Transaction := ATransaction;
    s := getinstalldir;
    AConnection.DatabaseName := s+'/PLCRM.db';
    AQuery := TSQLQuery.Create(nil);
    AQuery.SQL.Text := SQLString;
    AQuery.Database := AConnection;
    AQuery.Open;
  finally
    if AQuery.RecordCount = 0 then
      CheckID := False
    else
      CheckID := True;
    AQuery.Close;
    AConnection.Close;
    AQuery.Free;
    ATransaction.Free;
    AConnection.Free;
  end;
end;

//Groupts
Function TCRMGroupdoc.NewContactAndGroup(NewContact : Integer; NewGroup :Integer) : Boolean;
var
  s : String;
begin
  AConnection := TSQLite3Connection.Create(nil);
  ATransaction := TSQLTransaction.Create(AConnection);
  AConnection.Transaction := ATransaction;
  s := getinstalldir;
  AConnection.DatabaseName := s+'/PLCRM.db';
  AQuery := TSQLQuery.Create(nil);
  if CheckID(NewContact) = true then
    begin
      SQLString := 'SELECT contact_id FROM contact_groups WHERE contact_id = ' + IntToStr(NewContact);
      try
        AQuery.DataBase := AConnection;
        AQuery.SQL.Text := SQLString;
        AQuery.Open;
        AQuery.Edit;
        AQuery.FieldByName('group_id').AsInteger := NewGroup;
        AQuery.Post;
        AQuery.UpdateMode := upWhereAll;         // defined in db
        AQuery.ApplyUpdates;
        ATransaction.Commit;
      finally
        AQuery.Close;
      end;
    end;
  if CheckID(NewContact) = false then
    begin
      try
        ATransaction.StartTransaction;
        AConnection.ExecuteDirect('insert into contact_groups (contact_id,group_id) values (' + InttoStr(NewContact) + ',' + IntToStr(NewGroup) + ');');
      finally
        ATransaction.Commit;
      end;
    end;
  AConnection.Close;
  AQuery.Free;
  ATransaction.Free;
  AConnection.Free;
  NewContactAndGroup := true;
end;

end.

