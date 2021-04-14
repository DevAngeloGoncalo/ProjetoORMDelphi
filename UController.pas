unit UController;

interface

uses
  Data.DB,
  UORMAluno, System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, UFiltragem;

type
  TController = class(TObject)
  private
    FIdValue: integer;
    FNomeValue: string;
    FCursoValue: string;
    FTurnoValue: string;
    FPeriodoValue: integer;
    FDataIngressoValue: TDate;
    FSituacaoValue: string;
    FCadeiranteValue: integer;
    FObservacaoValue: string;
    FDataHoraInclusaoValue: TDateTime;
    FUsuarioInclusaoValue: string;
    FDataHoraAlteracaoValue: TDateTime;
    FUsuarioAlteracaoValue: string;
    Fmensagem: string;
    confirmation: boolean;

    function getnomeValue: string;
    function getIdValue: integer;
    function getCursoValue: string;
    function getTurnoValue: string;
    function getPeriodoValue: integer;
    function getDataIngressoValue: TDate;
    function getSituacaoValue: string;
    function getCadeiranteValue: integer;
    function getObservacaoValue: string;
    function getDataHoraInclusaoValue: TDateTime;
    function getUsuarioInclusaoValue: string;
    function getDataHoraAlteracaoValue: TDateTime;
    function getUsuarioAlteracaoValue: string;
    procedure setCadeiranteValue(const Value: integer);
    procedure setCursoValue(const Value: string);
    procedure setDataHoraAlteracaoValue(const Value: TDateTime);
    procedure setDataHoraInclusaoValue(const Value: TDateTime);
    procedure setDataIngressoValue(const Value: TDate);
    procedure setIdValue(const Value: integer);
    procedure setNomeValue(const Value: string);
    procedure setObservacaoValue(const Value: string);
    procedure setPeriodoValue(const Value: integer);
    procedure setSituacaoValue(const Value: string);
    procedure setTurnoValue(const Value: string);
    procedure setUsuarioAlteracaoValue(const Value: string);
    procedure setUsuarioInclusaoValue(const Value: string);
    function GetMensagem: string;

  public
    function Select(ColunaSelect: TFiltroSelect): TDataSet; overload;
    function Select(IdSelect: integer): TDataSet; overload;
    function Materialize(IdSelect: integer): integer;
    function Insert: boolean;
    function Alterar: boolean;
    procedure Delete(index: integer);
    function Filtrar: TDataSet;
    function SetId: integer;

    property IdValue: integer read getIdValue write setIdValue;
    property NomeValue: string read getnomeValue write setNomeValue;
    property CursoValue: string read getCursoValue write setCursoValue;
    property TurnoValue: string read getTurnoValue write setTurnoValue;
    property PeriodoValue: integer read getPeriodoValue write setPeriodoValue;
    property DataIngressoValue: TDate read getDataIngressoValue
      write setDataIngressoValue;
    property SituacaoValue: string read getSituacaoValue write setSituacaoValue;
    property CadeiranteValue: integer read getCadeiranteValue
      write setCadeiranteValue;
    property ObservacaoValue: string read getObservacaoValue
      write setObservacaoValue;
    property DataHoraInclusaoValue: TDateTime read getDataHoraInclusaoValue
      write setDataHoraInclusaoValue;
    property UsuarioInclusaoValue: string read getUsuarioInclusaoValue
      write setUsuarioInclusaoValue;
    property DataHoraAlteracaoValue: TDateTime read getDataHoraAlteracaoValue
      write setDataHoraAlteracaoValue;
    property UsuarioAlteracaoValue: string read getUsuarioAlteracaoValue
      write setUsuarioAlteracaoValue;
    property mensagem: string read GetMensagem;

  end;

  TConexao = class
  strict private
    class var FInstance: TConexao;
  private
    FConexaoDados: TFDConnection;
    class procedure ReleaseInstance();
    function getConexaoDados: TFDConnection;
  public
    property conexaoDados: TFDConnection read getConexaoDados;
    class function GetInstance(): TConexao;
  end;

implementation

{ TConexao }

function TConexao.getConexaoDados: TFDConnection;
begin
  result := FConexaoDados;
end;

class function TConexao.GetInstance: TConexao;
var
  conexao: TFDConnection;
begin
  if not Assigned(Self.FInstance) then
  begin
    Self.FInstance := TConexao.Create;
    conexao := TFDConnection.Create(nil);
    conexao.DriverName := 'MSSQL';
    with conexao.Params do
    begin
      Add('Server=localhost');
      Add('Database=BancoORM');
      Add('User_Name=sa');
      Add('Password=admserver01');
    end;
    Self.FInstance.FConexaoDados := conexao;
  end;

  result := Self.FInstance;
end;

class procedure TConexao.ReleaseInstance;
begin
  if Assigned(Self.FInstance) then
  begin
    Self.FInstance.Free;
  end;
end;

{ TController }

function TController.Alterar: boolean;
var
  obj: TORMAluno;
  tempTurno: string;
  tempSituacao: string;
  con: TConexao;
  key: boolean;
begin
  key := false;
  try
    try
      con := TConexao.GetInstance;
      obj := TORMAluno.Create;
      obj.conexao := con.FConexaoDados;
      obj.IdAluno.Value := IdValue;
      if NomeValue <> '' then
      begin
        obj.nomeAluno.Value := NomeValue;
      end
      else
      begin
        obj.nomeAluno.clear;
      end;
      if CursoValue <> '' then
      begin
        obj.Curso.Value := CursoValue;
      end
      else
      begin
        obj.Curso.clear;
      end;
      if TurnoValue <> '' then
      begin
        tempTurno := TurnoValue;
        SetLength(tempTurno, 1);
        obj.Turno.Value := tempTurno[1];
      end
      else
      begin
        obj.Turno.clear;
      end;

      if PeriodoValue <> 0 then
      begin
        obj.Periodo.Value := PeriodoValue;
      end
      else
      begin
        obj.Periodo.clear;
      end;
      obj.DataIngresso.Value := DataIngressoValue;
      if SituacaoValue <> '' then
      begin
        tempSituacao := SituacaoValue;
        SetLength(tempSituacao, 1);
        obj.Situacao.Value := tempSituacao[1];
      end
      else
      begin
        obj.Situacao.clear;
      end;
      if CadeiranteValue = 1 then
      begin
        obj.Cadeirante.Value := True;
      end
      else if CadeiranteValue = 2 then
      begin
        obj.Cadeirante.Value := false;
      end
      else if CadeiranteValue = 0 then
      begin
        obj.Cadeirante.clear;
      end;
      if ObservacaoValue <> '' then
      begin
        obj.Observacao.Value := ObservacaoValue;
      end
      else
      begin
        obj.Observacao.clear;
      end;
      obj.DataHoraAlteracao.Value := DataHoraAlteracaoValue;
      obj.UsuarioAlteracao.Value := UsuarioAlteracaoValue;
      confirmation := obj.Update;

    except
      on E: Exception do
      begin
        Fmensagem := E.Message;
        key := True;
      end;
    end;
  finally
    if key then
    begin
      Fmensagem := Fmensagem + ' ' + obj.Erro;
      Fmensagem := 'Algo deu errado: ' + Fmensagem;
    end
  end;

  if not(confirmation) then
  begin
    Fmensagem := Fmensagem + ' ' + obj.Erro;
    result := false;
  end
  else
  begin
    result := True;
  end;

end;

procedure TController.Delete(index: integer);
VAR
  con: TConexao;
  obj: TORMAluno;
begin
  obj := TORMAluno.Create;
  con := TConexao.GetInstance;
  obj.conexao := con.FConexaoDados;
  obj.IdAluno.Value := index;
  obj.Delete;
end;

function TController.Filtrar: TDataSet;
var
  Filter: TFiltragem;
  obj: TFiltroSelect;
  con: TConexao;
begin
  con := TConexao.GetInstance;
  obj := TFiltroSelect.Create;
  Filter := TFiltragem.Create;
  Filter.conexao := con.conexaoDados;
  if IdValue <> 0 then
  begin
    obj.IdAluno.Value := IdValue;
  end;
  if NomeValue <> '' then
  begin
    obj.nomeAluno.Value := NomeValue;
  end;
  if CursoValue <> '' then
  begin
    obj.Curso.Value := CursoValue;
  end;
  if SituacaoValue <> '' then
  begin
    obj.Situacao.Value := SituacaoValue[1];
  end;
  if PeriodoValue <> 0 then
  begin
    obj.Periodo.Value := PeriodoValue;
  end;

  result := Filter.Filtrar(obj);
end;

function TController.getCadeiranteValue: integer;
begin
  result := FCadeiranteValue;
end;

function TController.getCursoValue: string;
begin
  result := FCursoValue;
end;

function TController.getDataHoraAlteracaoValue: TDateTime;
begin
  result := FDataHoraAlteracaoValue;
end;

function TController.getDataHoraInclusaoValue: TDateTime;
begin
  result := FDataHoraInclusaoValue;
end;

function TController.getDataIngressoValue: TDate;
begin
  result := FDataIngressoValue;
end;

function TController.getIdValue: integer;
begin
  result := FIdValue;
end;

function TController.GetMensagem: string;
begin
  result := Fmensagem;
end;

function TController.getnomeValue: string;
begin
  result := FNomeValue;
end;

function TController.getObservacaoValue: string;
begin
  result := FObservacaoValue;
end;

function TController.getPeriodoValue: integer;
begin
  result := FPeriodoValue;
end;

function TController.getSituacaoValue: string;
begin
  result := FSituacaoValue;
end;

function TController.getTurnoValue: string;
begin
  result := FTurnoValue;
end;

function TController.getUsuarioAlteracaoValue: string;
begin
  result := FUsuarioAlteracaoValue;
end;

function TController.getUsuarioInclusaoValue: string;
begin
  result := FUsuarioInclusaoValue;
end;

function TController.Insert: boolean;
var
  obj: TORMAluno;
  tempTurno: string;
  tempSituacao: string;
  con: TConexao;
  key: boolean;
begin
  key := false;
  try
    try
      con := TConexao.GetInstance;
      obj := TORMAluno.Create;
      obj.conexao := con.FConexaoDados;
      obj.IdAluno.Value := IdValue;
      if NomeValue <> '' then
      begin
        obj.nomeAluno.Value := NomeValue;
      end
      else
      begin
        obj.nomeAluno.clear;
      end;
      if CursoValue <> '' then
      begin
        obj.Curso.Value := CursoValue;
      end
      else
      begin
        obj.Curso.clear;
      end;
      if TurnoValue <> '' then
      begin
        tempTurno := TurnoValue;
        SetLength(tempTurno, 1);
        obj.Turno.Value := tempTurno[1];
      end
      else
      begin
        obj.Turno.clear;
      end;

      if PeriodoValue <> 0 then
      begin
        obj.Periodo.Value := PeriodoValue;
      end
      else
      begin
        obj.Periodo.clear;
      end;
      obj.DataIngresso.Value := DataIngressoValue;
      if SituacaoValue <> '' then
      begin
        tempSituacao := SituacaoValue;
        SetLength(tempSituacao, 1);
        obj.Situacao.Value := tempSituacao[1];
      end
      else
      begin
        obj.Situacao.clear;
      end;
      if CadeiranteValue = 1 then
      begin
        obj.Cadeirante.Value := True;
      end
      else if CadeiranteValue = 2 then
      begin
        obj.Cadeirante.Value := false;
      end
      else if CadeiranteValue = 0 then
      begin
        obj.Cadeirante.clear;
      end;
      if ObservacaoValue <> '' then
      begin
        obj.Observacao.Value := ObservacaoValue;
      end
      else
      begin
        obj.Observacao.clear;
      end;
      obj.DataHoraInclusao.Value := DataHoraInclusaoValue;
      obj.UsuarioInclusao.Value := UsuarioInclusaoValue;
      obj.DataHoraAlteracao.Value := DataHoraAlteracaoValue;
      obj.UsuarioAlteracao.Value := UsuarioAlteracaoValue;
      confirmation := obj.Insert;
    except
      on E: Exception do
      begin
        Fmensagem := E.Message;
        key := True;
      end;
    end;
  finally
    if key then
    begin
      Fmensagem := Fmensagem + ' ' + obj.Erro;
      Fmensagem := 'Algo deu errado: ' + Fmensagem;
    end
  end;

  if not(confirmation) then
  begin
    Fmensagem := Fmensagem + ' ' + obj.Erro;
    result := false;
  end
  else
  begin
    result := True;
  end;

end;

function TController.Materialize(IdSelect: integer): integer;
var
  con: TConexao;
  obj: TORMAluno;
begin
  con := TConexao.GetInstance;
  obj := TORMAluno.Create;
  obj.conexao := con.FConexaoDados;
  obj.Materialize(IdSelect);
  FIdValue := obj.IdAluno.Value;
  FNomeValue := obj.nomeAluno.Value;
  FCursoValue := obj.Curso.Value;
  FTurnoValue := obj.Turno.Value;
  FPeriodoValue := obj.Periodo.Value;
  FDataIngressoValue := obj.DataIngresso.Value;
  FSituacaoValue := obj.Situacao.Value;
  if obj.Cadeirante.Assigned then
  begin
    if obj.Cadeirante.Value = True then
    begin
      FCadeiranteValue := 1;
    end
    else
    begin
      FCadeiranteValue := 0;
    end;
  end
  else
  begin
    FCadeiranteValue := 2;
  end;
  FObservacaoValue := obj.Observacao.Value;
  FDataHoraInclusaoValue := obj.DataHoraInclusao.Value;
  FUsuarioInclusaoValue := obj.UsuarioInclusao.Value;
  FDataHoraAlteracaoValue := obj.DataHoraAlteracao.Value;
  FUsuarioAlteracaoValue := obj.UsuarioAlteracao.Value;
  result := 1;
end;

function TController.Select(ColunaSelect: TFiltroSelect): TDataSet;
VAR
  con: TConexao;
  obj: TORMAluno;
begin
  obj := TORMAluno.Create;
  con := TConexao.GetInstance;
  obj.conexao := con.FConexaoDados;
  result := obj.Select(ColunaSelect);
end;

function TController.Select(IdSelect: integer): TDataSet;
VAR
  con: TConexao;
  obj: TORMAluno;
begin
  obj := TORMAluno.Create;
  con := TConexao.GetInstance;
  obj.conexao := con.FConexaoDados;
  result := obj.Select(IdSelect);
end;

procedure TController.setCadeiranteValue(const Value: integer);
begin
  FCadeiranteValue := Value;
end;

procedure TController.setCursoValue(const Value: string);
begin
  FCursoValue := Value;
end;

procedure TController.setDataHoraAlteracaoValue(const Value: TDateTime);
begin
  FDataHoraAlteracaoValue := Value;
end;

procedure TController.setDataHoraInclusaoValue(const Value: TDateTime);
begin
  FDataHoraInclusaoValue := Value;
end;

procedure TController.setDataIngressoValue(const Value: TDate);
begin
  FDataIngressoValue := Value;
end;

function TController.SetId: integer;
VAR
  con: TConexao;
  obj: TORMAluno;
begin
  obj := TORMAluno.Create;
  con := TConexao.GetInstance;
  obj.conexao := con.conexaoDados;

  result := obj.Max('Id_Aluno') + 1;
end;

procedure TController.setIdValue(const Value: integer);
begin
  FIdValue := Value;
end;

procedure TController.setNomeValue(const Value: string);
begin
  FNomeValue := Value;
end;

procedure TController.setObservacaoValue(const Value: string);
begin
  FObservacaoValue := Value;
end;

procedure TController.setPeriodoValue(const Value: integer);
begin
  FPeriodoValue := Value;
end;

procedure TController.setSituacaoValue(const Value: string);
begin
  FSituacaoValue := Value;
end;

procedure TController.setTurnoValue(const Value: string);
begin
  FTurnoValue := Value;
end;

procedure TController.setUsuarioAlteracaoValue(const Value: string);
begin
  FUsuarioAlteracaoValue := Value;
end;

procedure TController.setUsuarioInclusaoValue(const Value: string);
begin
  FUsuarioInclusaoValue := Value;
end;

end.
