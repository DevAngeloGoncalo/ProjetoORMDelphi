unit UORMGeral;

interface

USES
  FireDAC.Stan.Error, Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  System.SysUtils,
  System.Classes;

TYPE
  TORM = class(TObject)

  protected
    FReturndata: TFDMemTable;
    FnomeTabela: String;

    function getNomeTabela: String;
    procedure setNomeTabela(const Value: String);

    property nomeTabela: String read getNomeTabela write setNomeTabela;

  public
    QyCmd: TFDQuery;
    conexao: TFDconnection;
    function Insert: boolean; virtual;
    function Delete: boolean; virtual;
    function Update: boolean; virtual;

    function Max(coluna : string): integer;

  end;

implementation

{ TORM }

function TORM.Delete: boolean;
begin
  QyCmd := TFDQuery.Create(nil);
  QyCmd.Connection := conexao;
end;

function TORM.getNomeTabela: String;
begin
  Result := FnomeTabela;
end;

function TORM.Insert: boolean;
begin
  QyCmd := TFDQuery.Create(nil);
  QyCmd.Connection := conexao;
end;

function TORM.Max(coluna : string): integer;
begin
  QyCmd := TFDQuery.Create(nil);
  QyCmd.Connection := conexao;

  QyCmd.Open('SELECT  ISNULL(MAX('+ coluna + '), 0) AS ID FROM ' + nomeTabela + ' ');
  Result := QyCmd.FieldByName('ID').AsInteger;
  QyCmd.Close;
end;


procedure TORM.setNomeTabela(const Value: String);
begin
  FnomeTabela := Value;
end;

function TORM.Update: boolean;
begin
  QyCmd := TFDQuery.Create(nil);
  QyCmd.Connection := conexao;
end;

end.
