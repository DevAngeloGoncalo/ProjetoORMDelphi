unit UORMAluno;

interface

uses
  System.SysUtils, System.Classes,
  Data.DB, UTiposMelhorados, UORMGeral, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type

  TFiltroSelect = class(TObject)
  private
    FIdAluno: TIntegerMelhorado;
    FnomeAluno: TStringMelhorado;
    FCurso: TStringMelhorado;
    FTurno: TCharMelhorado;
    FPeriodo: TIntegerMelhorado;
    FDataIngresso: TDateMelhorado;
    FSituacao: TCharMelhorado;
    FCadeirante: TBoolMelhorado;
    FObservacao: TStringMelhorado;
    FDataHoraInclusao: TDateTimeMelhorado;
    FUsuarioInclusao: TStringMelhorado;
    FDataHoraAlteracao: TDateTimeMelhorado;
    FUsuarioAlteracao: TStringMelhorado;
    FErro: string;
    FErroLog: string;

    function getIdAluno: TIntegerMelhorado;
    function getnomeAluno: TStringMelhorado;
    function getCurso: TStringMelhorado;
    function getTurno: TCharMelhorado;
    function getPeriodo: TIntegerMelhorado;
    function getDataIngresso: TDateMelhorado;
    function getSituacao: TCharMelhorado;
    function getCadeirante: TBoolMelhorado;
    function getObservacao: TStringMelhorado;
    function getDataHoraInclusao: TDateTimeMelhorado;
    function getUsuarioInclusao: TStringMelhorado;
    function getDataHoraAlteracao: TDateTimeMelhorado;
    function getUsuarioAlteracao: TStringMelhorado;
    function getErro: string;
    function getErroLog: string;

  public
    QyCmd: TFDQuery;
    conexao: TFDconnection;
    property IdAluno: TIntegerMelhorado read getIdAluno;
    property nomeAluno: TStringMelhorado read getnomeAluno;
    property Curso: TStringMelhorado read getCurso;
    property Turno: TCharMelhorado read getTurno;
    property Periodo: TIntegerMelhorado read getPeriodo;
    property DataIngresso: TDateMelhorado read getDataIngresso;
    property Situacao: TCharMelhorado read getSituacao;
    property Cadeirante: TBoolMelhorado read getCadeirante;
    property Observacao: TStringMelhorado read getObservacao;
    property DataHoraInclusao: TDateTimeMelhorado read getDataHoraInclusao;
    property UsuarioInclusao: TStringMelhorado read getUsuarioInclusao;
    property DataHoraAlteracao: TDateTimeMelhorado read getDataHoraAlteracao;
    property UsuarioAlteracao: TStringMelhorado read getUsuarioAlteracao;
    property Erro: string read getErro;
    property ErroLog: string read getErroLog;
    constructor Create;

  end;

  TORMAluno = class(TORM)
  private
    FIdAluno: TIntegerMelhorado;
    FnomeAluno: TStringMelhorado;
    FCurso: TStringMelhorado;
    FTurno: TCharMelhorado;
    FPeriodo: TIntegerMelhorado;
    FDataIngresso: TDateMelhorado;
    FSituacao: TCharMelhorado;
    FCadeirante: TBoolMelhorado;
    FObservacao: TStringMelhorado;
    FDataHoraInclusao: TDateTimeMelhorado;
    FUsuarioInclusao: TStringMelhorado;
    FDataHoraAlteracao: TDateTimeMelhorado;
    FUsuarioAlteracao: TStringMelhorado;
    FErro: string;
    FErroLog: string;

    function getIdAluno: TIntegerMelhorado;
    function getnomeAluno: TStringMelhorado;
    function getCurso: TStringMelhorado;
    function getTurno: TCharMelhorado;
    function getPeriodo: TIntegerMelhorado;
    function getDataIngresso: TDateMelhorado;
    function getSituacao: TCharMelhorado;
    function getCadeirante: TBoolMelhorado;
    function getObservacao: TStringMelhorado;
    function getDataHoraInclusao: TDateTimeMelhorado;
    function getUsuarioInclusao: TStringMelhorado;
    function getDataHoraAlteracao: TDateTimeMelhorado;
    function getUsuarioAlteracao: TStringMelhorado;
    function getErro: string;
    function getErroLog: string;

  public
    property IdAluno: TIntegerMelhorado read getIdAluno;
    property nomeAluno: TStringMelhorado read getnomeAluno;
    property Curso: TStringMelhorado read getCurso;
    property Turno: TCharMelhorado read getTurno;
    property Periodo: TIntegerMelhorado read getPeriodo;
    property DataIngresso: TDateMelhorado read getDataIngresso;
    property Situacao: TCharMelhorado read getSituacao;
    property Cadeirante: TBoolMelhorado read getCadeirante;
    property Observacao: TStringMelhorado read getObservacao;
    property DataHoraInclusao: TDateTimeMelhorado read getDataHoraInclusao;
    property UsuarioInclusao: TStringMelhorado read getUsuarioInclusao;
    property DataHoraAlteracao: TDateTimeMelhorado read getDataHoraAlteracao;
    property UsuarioAlteracao: TStringMelhorado read getUsuarioAlteracao;
    property Erro: string read getErro;
    property ErroLog: string read getErroLog;
    constructor Create;

    function Select(ColunaSelect: TFiltroSelect): TDataSet; overload;
    function Select(IdSelect: integer): TDataSet; overload;
    function Verificador: boolean;
    function Insert: boolean; override;
    function Delete: boolean; override;
    function Update: boolean; override;
    function ClearAll: boolean;
    function Materialize(IdSelect: integer): boolean;

  end;

implementation

{ TORM }

function TORMAluno.ClearAll: boolean;
var
  key: boolean;
begin
  try
    try
      IdAluno.clear;
      nomeAluno.clear;
      Curso.clear;
      Turno.clear;
      Periodo.clear;
      DataIngresso.clear;
      Situacao.clear;
      Cadeirante.clear;
      Observacao.clear;
      DataHoraInclusao.clear;
      UsuarioInclusao.clear;
      DataHoraAlteracao.clear;
      UsuarioAlteracao.clear;
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado';
      result := false;
    end
    else
    begin
      FErro := 'Operação bem sucedida.';
      result := true;
    end;
  end;

end;

constructor TORMAluno.Create;
var
  key: boolean;
begin
  try
    try
      inherited Create;
      nomeTabela := 'aluno';
      conexao := TFDconnection.Create(nil);
      FIdAluno := TIntegerMelhorado.Create;
      FPeriodo := TIntegerMelhorado.Create;
      FnomeAluno := TStringMelhorado.Create;
      FnomeAluno.Len := 200;
      FCurso := TStringMelhorado.Create;
      FCurso.Len := 50;
      FObservacao := TStringMelhorado.Create;
      FObservacao.Len := 16;
      FUsuarioInclusao := TStringMelhorado.Create;
      FUsuarioInclusao.Len := 25;
      FUsuarioAlteracao := TStringMelhorado.Create;
      FUsuarioAlteracao.Len := 25;
      FTurno := TCharMelhorado.Create;
      FSituacao := TCharMelhorado.Create;
      FCadeirante := TBoolMelhorado.Create;
      FDataHoraInclusao := TDateTimeMelhorado.Create;
      FDataHoraAlteracao := TDateTimeMelhorado.Create;
      FDataIngresso := TDateMelhorado.Create;
      FReturndata := TFDMemTable.Create(nil);
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado';
    end
    else
    begin
      FErro := 'Operação bem sucedida.';
    end;
  end;
end;

function TORMAluno.Delete: boolean;
var
  key: boolean;
begin
  key := false;
  try
    try
      FErro := '';
      inherited;
      key := false;
      with QyCmd.SQL do
      begin
        clear;
        if IdAluno.Assigned then
        begin
          add('delete from aluno where id_aluno = ' + IntToStr(IdAluno.Value));
        end
        else
        begin
          FErro := 'O campo IdAluno precisa estar preenchido';
          result := false;
          exit;
        end;

      end;

      QyCmd.ExecSQL;
      key := false;
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado' + FErro;
      result := false;
    end
    else
    begin
      if QyCmd.RowsAffected = 0 then
      begin
        FErro := 'Nenhum aluno encontrado';
      end
      else
      begin
        FErro := 'Operação bem sucedida. ' + IntToStr(QyCmd.RowsAffected) +
          ' linhas foram afetadas.';
      end;
      result := true;
    end;
    QyCmd.Free;
  end;
end;

function TORMAluno.getCadeirante: TBoolMelhorado;
begin
  result := FCadeirante;
end;

function TORMAluno.getCurso: TStringMelhorado;
begin
  result := FCurso;
end;

function TORMAluno.getDataHoraAlteracao: TDateTimeMelhorado;
begin
  result := FDataHoraAlteracao;
end;

function TORMAluno.getDataHoraInclusao: TDateTimeMelhorado;
begin
  result := FDataHoraInclusao;
end;

function TORMAluno.getDataIngresso: TDateMelhorado;
begin
  result := FDataIngresso;
end;

function TORMAluno.getErro: string;
begin
  result := FErro;
end;

function TORMAluno.getErroLog: string;
begin
  result := FErroLog;
end;

function TORMAluno.getIdAluno: TIntegerMelhorado;
begin
  result := FIdAluno;
end;

function TORMAluno.getnomeAluno: TStringMelhorado;
begin
  result := FnomeAluno;
end;

function TORMAluno.getObservacao: TStringMelhorado;
begin
  result := FObservacao;
end;

function TORMAluno.getPeriodo: TIntegerMelhorado;
begin
  result := FPeriodo;
end;

function TORMAluno.getSituacao: TCharMelhorado;
begin
  result := FSituacao;
end;

function TORMAluno.getTurno: TCharMelhorado;
begin
  result := FTurno;
end;

function TORMAluno.getUsuarioAlteracao: TStringMelhorado;
begin
  result := FUsuarioAlteracao;
end;

function TORMAluno.getUsuarioInclusao: TStringMelhorado;
begin
  result := FUsuarioInclusao;
end;

function TORMAluno.Insert: boolean;
var
  key: boolean;
begin
  key := false;
  FErro := '';
  try
    try
      inherited;
      if Verificador then
      begin
        with QyCmd.SQL do
        begin
          clear;
          add('insert into Aluno');
          add('(');
          add('id_aluno,');
          add('nome_aluno,');
          add('curso,');
          add('turno,');
          add('periodo,');
          add('data_ingresso,');
          add('situacao,');
          if Cadeirante.Assigned then
          begin
            add('cadeirante,');
          end;
          if Observacao.Assigned then
          begin
            add('observacao,');
          end;
          add('data_hora_inclusao,');
          add('usuario_inclusao,');
          add('data_hora_alteracao,');
          add('usuario_alteracao');
          add(')');
          add('values');
          add('(');
          add('' + IntToStr(IdAluno.Value) + ',');
          add('''' + nomeAluno.Value + ''',');
          add('''' + Curso.Value + ''',');
          add('''' + Turno.Value + ''',');
          add('' + IntToStr(Periodo.Value) + ',');
          add('''' + FormatDateTime('dd-mm-yyyy', DataIngresso.Value) + ''',');
          add('''' + Situacao.Value + ''',');
          if Cadeirante.Assigned then
          begin
            add('' + BoolToStr(Cadeirante.Value) + ',');
          end;
          if Observacao.Assigned then
          begin
            add('''' + Observacao.Value + ''',');
          end;
          add('''' + FormatDateTime('dd-mm-yyyy hh:mm:ss',
            DataHoraInclusao.Value) + ''',');
          add('''' + UsuarioInclusao.Value + ''',');
          add('''' + FormatDateTime('dd-mm-yyyy hh:mm:ss',
            DataHoraAlteracao.Value) + ''',');
          add('''' + UsuarioAlteracao.Value + '''');
          add(')');
         // SaveToFile('D:\Estágio\SaveToFile\x.sql');
        end;
        QyCmd.ExecSQL;
      end
      else
      begin
        key := true;
        result := false;
      end;

    except
      on E: EFDDBEngineException do
      begin
        if E.Kind = ekUKViolated then
        begin
          FErro := ': O IdALuno já está cadastrado';
          FErroLog := E.Message;
          key := true;
        end
        else
        begin
          FErroLog := E.Message;
          key := true;
        end;
      end;
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado' + FErro;
      result := false;
    end
    else
    begin
      FErro := 'Operação bem sucedida';
      result := true;
    end;
    QyCmd.Free;
  end;

end;

function TORMAluno.Materialize(IdSelect: integer): boolean;
var
  key: boolean;
  temp: string;
begin
  try
    try
      Select(IdSelect);
      ClearAll;
      IdAluno.LoadFromField(FReturndata.FieldByName('id_aluno'));
      nomeAluno.LoadFromField(FReturndata.FieldByName('nome_aluno'));
      Curso.LoadFromField(FReturndata.FieldByName('curso'));
      Turno.LoadFromField(FReturndata.FieldByName('turno'));
      Periodo.LoadFromField(FReturndata.FieldByName('periodo'));
      DataIngresso.LoadFromField(FReturndata.FieldByName('data_ingresso'));
      Situacao.LoadFromField(FReturndata.FieldByName('situacao'));
      Cadeirante.LoadFromField(FReturndata.FieldByName('cadeirante'));
      Observacao.LoadFromField(FReturndata.FieldByName('observacao'));
      DataHoraInclusao.LoadFromField
        (FReturndata.FieldByName('data_hora_inclusao'));
      UsuarioInclusao.LoadFromField
        (FReturndata.FieldByName('usuario_inclusao'));
      DataHoraAlteracao.LoadFromField
        (FReturndata.FieldByName('data_hora_alteracao'));
      UsuarioAlteracao.LoadFromField
        (FReturndata.FieldByName('usuario_alteracao'));
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado';
      result := false;
    end
    else
    begin
      FErro := 'Operação bem sucedida.';
      result := true;
    end;
  end;
end;

function TORMAluno.Select(IdSelect: integer): TDataSet;
var
  key: boolean;
begin
  key := false;
  try
    try
      QyCmd := TFDQuery.Create(nil);
      QyCmd.Connection := conexao;
      QyCmd.SQL.clear;
      QyCmd.Open('select * from ' + nomeTabela + ' where id_aluno = ' +
        IntToStr(IdSelect));
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado';
    end
    else
    begin
      FReturndata.CopyDataSet(QyCmd, [coStructure, coAppend, coRestart]);
      FErro := 'Operação bem sucedida.';
      result := FReturndata;
    end;
  end;

  QyCmd.Close;
  QyCmd.Free;
end;

function TORMAluno.Select(ColunaSelect: TFiltroSelect): TDataSet;
var
  Erro: string;
  i: integer;
  key: boolean;
begin
  key := false;
  try
    try
      QyCmd := TFDQuery.Create(nil);
      QyCmd.Connection := conexao;
      QyCmd.SQL.clear;
      if ColunaSelect = nil then
      begin
        QyCmd.Open('select * from ' + nomeTabela);
      end
      else
      begin
        i := 0;
        QyCmd.SQL.add('select * from ' + nomeTabela + ' where ');
        if ColunaSelect.IdAluno.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('id_aluno = ''' +
            IntToStr(ColunaSelect.IdAluno.Value) + '''');
          i := i + 1;;
        end;
        if ColunaSelect.nomeAluno.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('nome_aluno = ''' +
            ColunaSelect.nomeAluno.Value + '''');
          i := i + 1;
        end;
        if ColunaSelect.Curso.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('curso = ''' + ColunaSelect.Curso.Value + '''');
          i := i + 1;
        end;
        if ColunaSelect.Turno.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('turno = ''' + ColunaSelect.Turno.Value + '''');
          i := i + 1;
        end;
        if ColunaSelect.Periodo.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('periodo = ''' +
            IntToStr(ColunaSelect.Periodo.Value) + '''');
          i := i + 1;
        end;
        if ColunaSelect.DataIngresso.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('data_ingresso  = ''' +
            DateToStr(ColunaSelect.DataIngresso.Value) + '''');
          i := i + 1;
        end;
        if ColunaSelect.Situacao.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('situacao = ''' + ColunaSelect.Situacao.Value + '''');
          i := i + 1;
        end;
        if ColunaSelect.Cadeirante.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('cadeirante = ''' +
            BoolToStr(ColunaSelect.Cadeirante.Value) + '''');
          i := i + 1;
        end;
        if ColunaSelect.Observacao.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('observacao LIKE ''' +
            ColunaSelect.Observacao.Value + '''');
          i := i + 1;
        end;
        if ColunaSelect.DataHoraInclusao.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('data_hora_inclusao = ''' +
            DateTimeToStr(ColunaSelect.DataHoraInclusao.Value) + '''');
          i := i + 1;
        end;
        if ColunaSelect.UsuarioInclusao.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('usuario_inclusao = ''' +
            ColunaSelect.UsuarioInclusao.Value + '''');
          i := i + 1;
        end;
        if ColunaSelect.DataHoraAlteracao.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('data_hora_alteracao = ''' +
            DateTimeToStr(ColunaSelect.DataHoraAlteracao.Value) + '''');
          i := i + 1;
        end;
        if ColunaSelect.UsuarioAlteracao.Assigned then
        begin
          if i <> 0 then
          begin
            QyCmd.SQL.add(' and ');
          end;
          QyCmd.SQL.add('usuario_alteracao = ''' +
            ColunaSelect.UsuarioAlteracao.Value + '''');
        end;
        QyCmd.Open;
      end;
      Erro := QyCmd.SQL.Text;
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado';
    end
    else
    begin
      FReturndata.CopyDataSet(QyCmd, [coStructure, coAppend, coRestart]);
      FErro := 'Operação bem sucedida.';
      result := FReturndata;
    end;
  end;
  QyCmd.Close;
  QyCmd.Free;
end;

function TORMAluno.Update: boolean;
var
  key: boolean;
begin
  key := false;
  try
    try
      inherited;
      if Verificador then
      begin
        with QyCmd.SQL do
        begin
          clear;
          add('UPDATE Aluno');
          add('SET');
          add('nome_aluno = ''' + nomeAluno.Value + ''',');
          add('curso = ''' + Curso.Value + ''',');
          add('turno = ''' + Turno.Value + ''',');
          add('periodo = ' + IntToStr(Periodo.Value) + ',');
          add('data_ingresso = ''' + FormatDateTime('yyyy-mm-dd',
            DataIngresso.Value) + ''',');
          add('situacao = ''' + Situacao.Value + ''',');
          if Cadeirante.Assigned then
          begin
            add('cadeirante = ' + BoolToStr(Cadeirante.Value) + ',');
          end
          else
          begin
            add('cadeirante = ' + 'NULL' + ',');
          end;
          if Observacao.Assigned then
          begin
            add('observacao = ''' + Observacao.Value + ''',')
          end
          else
          begin
            add('observacao = ' + 'NULL' + ',');
          end;
          add('data_hora_alteracao = ''' + FormatDateTime('dd-mm-yyyy hh:nn:ss',
            DataHoraAlteracao.Value) + ''',');
          add('usuario_alteracao = ''' + UsuarioAlteracao.Value + '''');
          add('WHERE id_aluno = ' + IntToStr(IdAluno.Value) + '');
        end;
        QyCmd.ExecSQL;
        key := false;
      end
      else
      begin
        key := true;
      end;

    except
      on F: Exception do
      begin
        FErro := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado: ' + FErro;
      result := false;
    end
    else
    begin
      if QyCmd.RowsAffected = 0 then
      begin
        FErro := 'Nenhum aluno encontrado';
      end
      else
      begin
        FErro := 'Operação bem sucedida. ' + IntToStr(QyCmd.RowsAffected) +
          ' linhas foram afetadas.';
      end;
      result := true;
    end;
  end;
  QyCmd.Free;
end;

function TORMAluno.Verificador: boolean;
var
  key: boolean;
begin
  key := false;
  try
    try
      FErro := '';
      if (IdAluno.Assigned = false) then
      begin
        FErro := FErro + '- IdAluno não pode ser vazio ' + #13#10;
      end;
      if (nomeAluno.Value = '') AND (nomeAluno.Assigned = false) then
      begin
        FErro := FErro + #13#10 + '- nomeAluno não pode ser vazio' + #13#10;
      end;
      if (nomeAluno.Value <> '') AND (nomeAluno.Assigned = false) then
      begin
        FErro := FErro + '- nomeAluno tem que ter até 200 caracteres' + #13#10;
      end;
      if (Curso.Value = '') AND (Curso.Assigned = false) then
      begin
        FErro := FErro + '- Curso não pode ser vazio' + #13#10;
      end;
      if (Curso.Value <> '') AND (Curso.Assigned = false) then
      begin
        FErro := FErro + '- Curso tem que ter até 50 caracteres' + #13#10;
      end;
      if Turno.Assigned = false then
      begin
        FErro := FErro + '- Turno não pode ser vazio' + #13#10;
      end;
      if Periodo.Assigned = false then
      begin
        FErro := FErro + '- Periodo não pode ser vazio' + #13#10;
      end;
      if Situacao.Assigned = false then
      begin
        FErro := FErro + '- Situação não pode ser vazio' + #13#10;
      end;
      if (Observacao.Value <> '') AND (Observacao.Assigned = false) then
      begin
        FErro := FErro + '- Observacao tem que ter até 16 caracteres' + #13#10;
      end;

    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado: ' + FErro;
      result := false;
    end
    else
    begin
      if FErro <> '' then
      begin
        result := false;
      end
      else
      begin
        result := true;
      end;
    end;
  end;
end;

{ TFiltroSelect }

constructor TFiltroSelect.Create;
var
  key: boolean;
begin
  key := false;
  try
    try
      inherited;
      FIdAluno := TIntegerMelhorado.Create;
      FPeriodo := TIntegerMelhorado.Create;
      FnomeAluno := TStringMelhorado.Create;
      FnomeAluno.Len := 200;
      FCurso := TStringMelhorado.Create;
      FCurso.Len := 50;
      FObservacao := TStringMelhorado.Create;
      FObservacao.Len := 16;
      FUsuarioInclusao := TStringMelhorado.Create;
      FUsuarioInclusao.Len := 25;
      FUsuarioAlteracao := TStringMelhorado.Create;
      FUsuarioAlteracao.Len := 25;
      FTurno := TCharMelhorado.Create;
      FSituacao := TCharMelhorado.Create;
      FCadeirante := TBoolMelhorado.Create;
      FDataHoraInclusao := TDateTimeMelhorado.Create;
      FDataHoraAlteracao := TDateTimeMelhorado.Create;
      FDataIngresso := TDateMelhorado.Create;
    except
      on F: Exception do
      begin
        FErroLog := F.Message;
        key := true;
      end;
    end;
  finally
    if key then
    begin
      FErro := 'Algo deu errado';
    end
    else
    begin
      FErro := 'Operação bem sucedida.';
    end;
  end;
end;

function TFiltroSelect.getCadeirante: TBoolMelhorado;
begin
  result := FCadeirante;
end;

function TFiltroSelect.getCurso: TStringMelhorado;
begin
  result := FCurso;
end;

function TFiltroSelect.getDataHoraAlteracao: TDateTimeMelhorado;
begin
  result := FDataHoraAlteracao;
end;

function TFiltroSelect.getDataHoraInclusao: TDateTimeMelhorado;
begin
  result := FDataHoraInclusao;
end;

function TFiltroSelect.getDataIngresso: TDateMelhorado;
begin
  result := FDataIngresso;
end;

function TFiltroSelect.getErro: string;
begin
  result := FErro;
end;

function TFiltroSelect.getErroLog: string;
begin
  result := FErroLog;
end;

function TFiltroSelect.getIdAluno: TIntegerMelhorado;
begin
  result := FIdAluno;
end;

function TFiltroSelect.getnomeAluno: TStringMelhorado;
begin
  result := FnomeAluno;
end;

function TFiltroSelect.getObservacao: TStringMelhorado;
begin
  result := FObservacao;
end;

function TFiltroSelect.getPeriodo: TIntegerMelhorado;
begin
  result := FPeriodo;
end;

function TFiltroSelect.getSituacao: TCharMelhorado;
begin
  result := FSituacao;
end;

function TFiltroSelect.getTurno: TCharMelhorado;
begin
  result := FTurno;
end;

function TFiltroSelect.getUsuarioAlteracao: TStringMelhorado;
begin
  result := FUsuarioAlteracao;
end;

function TFiltroSelect.getUsuarioInclusao: TStringMelhorado;
begin
  result := FUsuarioInclusao;
end;

end.
