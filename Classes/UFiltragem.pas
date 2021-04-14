unit UFiltragem;

interface

uses
  System.SysUtils, System.Classes, UORMAluno, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TFiltragem = class(TORMAluno)
  public
    FErroLog: string;
    FErro: string;
    QyCmd: TFDQuery;
    conexao: TFDconnection;
    function Filtrar(ColunaSelect: TFiltroSelect): TDataSet;
  end;

implementation

{ TFiltragem }

function TFiltragem.Filtrar(ColunaSelect: TFiltroSelect): TDataSet;
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
      i := 0;
      QyCmd.SQL.add('select * from aluno where ');
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
        QyCmd.SQL.add('nome_aluno LIKE ''%' +
          ColunaSelect.nomeAluno.Value + '%''');
        i := i + 1;
      end;
      if ColunaSelect.Curso.Assigned then
      begin
        if i <> 0 then
        begin
          QyCmd.SQL.add(' and ');
        end;
        QyCmd.SQL.add('curso LIKE ''%' + ColunaSelect.Curso.Value + '%''');
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
        QyCmd.SQL.add('observacao LIKE ''%' +
          ColunaSelect.Observacao.Value + '%''');
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
      // end;
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

end.
