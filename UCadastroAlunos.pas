unit UCadastroAlunos;

interface

uses
  UController,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Listagem: TTabSheet;
    ButIncluir: TButton;
    ButAlterar: TButton;
    ButSalvar: TButton;
    ButCancelar: TButton;
    ButExcluir: TButton;
    Painel: TPanel;
    ButDetalhes: TButton;
    ButLimparFiltros: TButton;
    ButFiltrar: TButton;
    DBGrid: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Cadastro: TTabSheet;
    ButCadastroVoltar: TButton;
    EditCurso: TEdit;
    EditIdAluno: TEdit;
    EditNomeAluno: TEdit;
    EditSituacao: TEdit;
    EditUsuarioInclusao: TEdit;
    EditUsuarioAlteracao: TEdit;
    EditTurno: TEdit;
    EditPeriodo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DateTimePickerIngresso: TDateTimePicker;
    ComboBoxCadeirante: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    EditFiltroId: TEdit;
    EditFiltroNome: TEdit;
    EditFiltroCurso: TEdit;
    EditFiltroSituacao: TEdit;
    EditFiltroPeriodo: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox1: TGroupBox;
    EditDataHoraInclusao: TEdit;
    EditDataHoraAltecacao: TEdit;
    Label18: TLabel;
    Label17: TLabel;
    MemoObservacao: TMemo;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButIncluirClick(Sender: TObject);
    procedure ButCadastroVoltarClick(Sender: TObject);
    procedure ButAlterarClick(Sender: TObject);
    procedure ButExcluirClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ButSalvarClick(Sender: TObject);
    procedure ButDetalhesClick(Sender: TObject);
    procedure ButCancelarClick(Sender: TObject);
    procedure ButFiltrarClick(Sender: TObject);
    procedure ButLimparFiltrosClick(Sender: TObject);

  private
    { Private declarations }
    control: TController;
    auxSave: integer;
    confirmation: boolean;

    procedure MaterializeEdits;
    procedure Insert;
    procedure Update;
    procedure Limpar;
    procedure salvar(opc: integer);
    procedure acoesBotoes(botao: string);
    procedure gridCustom;
    procedure limparFiltros;
    procedure filtrar;
    procedure setId;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButIncluirClick(Sender: TObject);
begin
  acoesBotoes('incluir');
  setId;
end;

procedure TForm1.ButLimparFiltrosClick(Sender: TObject);
begin
  acoesBotoes('limpar');
end;

procedure TForm1.ButSalvarClick(Sender: TObject);
begin
  acoesBotoes('salvar');
end;

procedure TForm1.Limpar;
begin
  EditCurso.Clear;
  EditIdAluno.Clear;
  EditNomeAluno.Clear;
  EditSituacao.Clear;
  EditUsuarioInclusao.Clear;
  EditUsuarioAlteracao.Clear;
  EditTurno.Clear;
  EditPeriodo.Clear;
  MemoObservacao.Clear;
  ComboBoxCadeirante.ItemIndex := 0;
  DateTimePickerIngresso.Date := Date;
end;

procedure TForm1.limparFiltros;
begin
  EditFiltroId.Clear;
  EditFiltroNome.Clear;
  EditFiltroCurso.Clear;
  EditFiltroSituacao.Clear;
  EditFiltroPeriodo.Clear;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if DBGrid.DataSource.DataSet.IsEmpty then
  begin
    ButExcluir.Enabled := False;
    ButDetalhes.Enabled := False;
  end
  else
  begin
    ButDetalhes.Enabled := True;
  end;
end;

procedure TForm1.filtrar;
begin
  control := TController.Create;
  if (EditFiltroId.Text = '') and (EditFiltroNome.Text = '') and
    (EditFiltroCurso.Text = '') and (EditFiltroSituacao.Text = '') and
    (EditFiltroPeriodo.Text = '') then
  begin
    DataSource1.DataSet := control.Select(nil);
  end
  else
  begin
    if EditFiltroId.Text <> '' then
    begin
      control.IdValue := StrToInt(EditFiltroId.Text);
    end;
    if EditFiltroNome.Text <> '' then
    begin
      control.NomeValue := EditFiltroNome.Text;
    end;
    if EditFiltroCurso.Text <> '' then
    begin
      control.CursoValue := EditFiltroCurso.Text;
    end;
    if EditFiltroSituacao.Text <> '' then
    begin
      control.SituacaoValue := EditFiltroSituacao.Text[1];
    end;
    if EditFiltroPeriodo.Text <> '' then
    begin
      control.PeriodoValue := StrToInt(EditFiltroPeriodo.Text);
    end;

    DataSource1.DataSet := control.filtrar;
  end;
end;

procedure TForm1.ButExcluirClick(Sender: TObject);
begin
  acoesBotoes('excluir');
end;

procedure TForm1.ButFiltrarClick(Sender: TObject);
begin
  acoesBotoes('filtrar');
end;

procedure TForm1.acoesBotoes(botao: string);
var
  butSelected: integer;
  c: TDateTime;
begin
  if botao = 'alterar' then
  begin
    Cadastro.TabVisible := True;
    Listagem.TabVisible := False;
    ButIncluir.Enabled := False;
    ButAlterar.Enabled := False;
    ButExcluir.Enabled := False;
    ButSalvar.Enabled := True;
    ButCancelar.Enabled := True;
    ButCadastroVoltar.Enabled := False;
    EditUsuarioInclusao.Visible := False;
    EditUsuarioAlteracao.Visible := False;
    EditDataHoraInclusao.Visible := False;
    EditDataHoraAltecacao.Visible := False;
    Label10.Visible := False;
    Label11.Visible := False;
    Label17.Visible := False;
    Label18.Visible := False;

    EditCurso.ReadOnly := False;
    EditIdAluno.ReadOnly := True;
    EditNomeAluno.ReadOnly := False;
    EditCurso.ReadOnly := False;
    EditTurno.ReadOnly := False;
    EditPeriodo.ReadOnly := False;
    DateTimePickerIngresso.Enabled := True;
    ComboBoxCadeirante.Enabled := True;
    EditSituacao.ReadOnly := False;
    EditUsuarioInclusao.ReadOnly := False;
    EditUsuarioAlteracao.ReadOnly := False;
    MemoObservacao.ReadOnly := False;

    MaterializeEdits;

    auxSave := 2;
  end
  else if botao = 'excluir' then
  begin
    butSelected := messagedlg('Quer mesmo Excluir este registro?',
      mtConfirmation, mbYesNo, 0);
    if butSelected = mrYes then
    begin
      control := TController.Create;
      control.Delete(StrToInt(DataSource1.DataSet.FieldByName('ID_Aluno')
        .AsString));
      DataSource1.DataSet.Delete;
      gridCustom;
    end;
    Cadastro.TabVisible := False;
    Listagem.TabVisible := True;
  end
  else if botao = 'incluir' then
  begin
    Cadastro.TabVisible := True;
    Listagem.TabVisible := False;

    ButIncluir.Enabled := False;
    ButAlterar.Enabled := False;
    ButExcluir.Enabled := False;
    ButSalvar.Enabled := True;
    ButCancelar.Enabled := True;
    ButCadastroVoltar.Enabled := False;
    EditUsuarioInclusao.Visible := False;
    EditUsuarioAlteracao.Visible := False;
    EditDataHoraInclusao.Visible := False;
    EditDataHoraAltecacao.Visible := False;
    Label10.Visible := False;
    Label11.Visible := False;
    Label17.Visible := False;
    Label18.Visible := False;

    EditCurso.ReadOnly := False;
    EditIdAluno.ReadOnly := True;
    EditNomeAluno.ReadOnly := False;
    EditCurso.ReadOnly := False;
    EditTurno.ReadOnly := False;
    EditPeriodo.ReadOnly := False;
    DateTimePickerIngresso.Enabled := True;
    ComboBoxCadeirante.Enabled := True;
    EditSituacao.ReadOnly := False;
    EditUsuarioInclusao.ReadOnly := False;
    EditUsuarioAlteracao.ReadOnly := False;
    MemoObservacao.ReadOnly := False;

    Limpar;
    auxSave := 1;
  end
  else if botao = 'salvar' then
  begin
    salvar(auxSave);

    if auxSave = 1 then
    begin
      if not(confirmation) then
      begin
        ShowMessage(control.mensagem);
      end
      else
      begin
        ButExcluir.Enabled := True;
        ButSalvar.Enabled := False;
        ButCancelar.Enabled := False;
        ButCadastroVoltar.Enabled := True;
        EditUsuarioInclusao.Visible := True;
        EditUsuarioAlteracao.Visible := True;
        EditDataHoraInclusao.Visible := True;
        EditDataHoraAltecacao.Visible := True;
        Label10.Visible := True;
        Label11.Visible := True;
        Label17.Visible := True;
        Label18.Visible := True;

        EditCurso.ReadOnly := True;
        EditIdAluno.ReadOnly := True;
        EditNomeAluno.ReadOnly := True;
        EditCurso.ReadOnly := True;
        EditTurno.ReadOnly := True;
        EditPeriodo.ReadOnly := True;
        DateTimePickerIngresso.Enabled := False;
        ComboBoxCadeirante.Enabled := False;
        EditSituacao.ReadOnly := True;
        EditUsuarioInclusao.ReadOnly := True;
        EditUsuarioAlteracao.ReadOnly := True;
        EditDataHoraInclusao.ReadOnly := True;
        EditDataHoraAltecacao.ReadOnly := True;
        MemoObservacao.ReadOnly := True;

        EditDataHoraInclusao.Enabled := True;
        EditDataHoraAltecacao.Enabled := True;

        control := TController.Create;
        DataSource1.DataSet := control.Select(StrToInt(EditIdAluno.Text));
        MaterializeEdits;
        gridCustom;
      end;

    end
    else
    begin
      if not(confirmation) then
      begin
        ShowMessage(control.mensagem);
      end
      else
      begin
        ButExcluir.Enabled := True;
        ButSalvar.Enabled := False;
        ButCancelar.Enabled := False;
        ButCadastroVoltar.Enabled := True;
        EditUsuarioInclusao.Visible := True;
        EditUsuarioAlteracao.Visible := True;
        EditDataHoraInclusao.Visible := True;
        EditDataHoraAltecacao.Visible := True;
        Label10.Visible := True;
        Label11.Visible := True;
        Label17.Visible := True;
        Label18.Visible := True;

        EditCurso.ReadOnly := True;
        EditIdAluno.ReadOnly := True;
        EditNomeAluno.ReadOnly := True;
        EditCurso.ReadOnly := True;
        EditTurno.ReadOnly := True;
        EditPeriodo.ReadOnly := True;
        DateTimePickerIngresso.Enabled := False;
        ComboBoxCadeirante.Enabled := False;
        EditSituacao.ReadOnly := True;
        EditUsuarioInclusao.ReadOnly := True;
        EditUsuarioAlteracao.ReadOnly := True;
        EditDataHoraInclusao.ReadOnly := True;
        EditDataHoraAltecacao.ReadOnly := True;
        MemoObservacao.ReadOnly := True;

        EditDataHoraInclusao.Enabled := True;
        EditDataHoraAltecacao.Enabled := True;

        c := now;
        EditDataHoraAltecacao.Text := DateTimeToStr(c);
        DataSource1.DataSet := control.Select(StrToInt(EditIdAluno.Text));
        gridCustom;
        DataSource1.DataSet.Locate('id_aluno', EditIdAluno.Text, []);
      end;
    end;

  end
  else if botao = 'cancelar' then
  begin
    if auxSave = 3 then
    begin
      ButExcluir.Enabled := True;
      ButSalvar.Enabled := False;
      ButCancelar.Enabled := False;
      ButCadastroVoltar.Enabled := True;
      ButIncluir.Enabled := True;
      ButAlterar.Enabled := True;
      EditUsuarioInclusao.Visible := True;
      EditUsuarioAlteracao.Visible := True;
      EditDataHoraInclusao.Visible := True;
      EditDataHoraAltecacao.Visible := True;
      Label10.Visible := True;
      Label11.Visible := True;
      Label17.Visible := True;
      Label18.Visible := True;

      MaterializeEdits;
      EditCurso.ReadOnly := True;
      EditIdAluno.ReadOnly := True;
      EditNomeAluno.ReadOnly := True;
      EditCurso.ReadOnly := True;
      EditTurno.ReadOnly := True;
      EditPeriodo.ReadOnly := True;
      DateTimePickerIngresso.Enabled := False;
      ComboBoxCadeirante.Enabled := False;
      EditSituacao.ReadOnly := True;
      EditUsuarioInclusao.ReadOnly := True;
      EditUsuarioAlteracao.ReadOnly := True;
      EditDataHoraInclusao.ReadOnly := True;
      EditDataHoraAltecacao.ReadOnly := True;
      MemoObservacao.ReadOnly := True;

      EditDataHoraInclusao.Enabled := True;
      EditDataHoraAltecacao.Enabled := True;
    end
    else
    begin
      Cadastro.TabVisible := False;
      Listagem.TabVisible := True;
      ButExcluir.Enabled := True;
      ButIncluir.Enabled := True;
      ButAlterar.Enabled := True;
      ButSalvar.Enabled := False;
      ButCancelar.Enabled := False;
      gridCustom;
    end;

  end
  else if botao = 'detalhes' then
  begin
    Cadastro.TabVisible := True;
    Listagem.TabVisible := False;

    ButExcluir.Enabled := True;
    ButSalvar.Enabled := False;
    ButCancelar.Enabled := False;
    ButCadastroVoltar.Enabled := True;
    EditUsuarioInclusao.Visible := True;
    EditUsuarioAlteracao.Visible := True;
    EditDataHoraInclusao.Visible := True;
    EditDataHoraAltecacao.Visible := True;
    Label10.Visible := True;
    Label11.Visible := True;
    Label17.Visible := True;
    Label18.Visible := True;
    MaterializeEdits;

    EditCurso.ReadOnly := True;
    EditIdAluno.ReadOnly := True;
    EditNomeAluno.ReadOnly := True;
    EditCurso.ReadOnly := True;
    EditTurno.ReadOnly := True;
    EditPeriodo.ReadOnly := True;
    DateTimePickerIngresso.Enabled := False;
    ComboBoxCadeirante.Enabled := False;
    EditSituacao.ReadOnly := True;
    EditUsuarioInclusao.ReadOnly := True;
    EditUsuarioAlteracao.ReadOnly := True;
    EditDataHoraInclusao.ReadOnly := True;
    EditDataHoraAltecacao.ReadOnly := True;
    MemoObservacao.ReadOnly := True;

    EditDataHoraInclusao.Enabled := True;
    EditDataHoraAltecacao.Enabled := True;
  end
  else if botao = 'filtrar' then
  begin
    control := TController.Create;
    filtrar;
    gridCustom;
  end
  else if botao = 'limpar' then
  begin
    limparFiltros;
    DataSource1.DataSet := control.Select(nil);
    gridCustom;
  end
  else if botao = 'voltar' then
  begin
    Cadastro.TabVisible := False;
    Listagem.TabVisible := True;

    ButIncluir.Enabled := True;
    ButAlterar.Enabled := True;
    ButSalvar.Enabled := False;
    ButCancelar.Enabled := False;
  end;
end;

procedure TForm1.ButAlterarClick(Sender: TObject);
begin
  acoesBotoes('alterar');
end;

procedure TForm1.ButCadastroVoltarClick(Sender: TObject);
begin
  acoesBotoes('voltar');
end;

procedure TForm1.ButCancelarClick(Sender: TObject);
begin
  acoesBotoes('cancelar');
end;

procedure TForm1.ButDetalhesClick(Sender: TObject);
begin
  auxSave := 3;
  acoesBotoes('detalhes');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  control := TController.Create;
  DataSource1.DataSet := control.Select(nil);
  ComboBoxCadeirante.ItemIndex := 0;
  Cadastro.TabVisible := False;
  ButSalvar.Enabled := False;
  ButCancelar.Enabled := False;

  gridCustom;

  if DataSource1.DataSet.IsEmpty then
  begin
    ButDetalhes.Enabled := False;
    ButAlterar.Enabled := False;
  end;
end;

procedure TForm1.gridCustom;
begin
  DBGrid.Columns[0].Title.Caption := 'ID';
  DBGrid.Columns[1].Title.Caption := 'Nome';
  DBGrid.Columns[2].Title.Caption := 'Curso';
  DBGrid.Columns[3].Title.Caption := 'Turno';
  DBGrid.Columns[4].Title.Caption := 'Período';
  DBGrid.Columns[5].Title.Caption := 'Data de Ingresso';
  DBGrid.Columns[6].Title.Caption := 'Situação';
  DBGrid.Columns[7].Title.Caption := 'Cadeirante';
  DBGrid.Columns[8].Title.Caption := 'Observação';
  DBGrid.Columns[9].Title.Caption := 'Data/Hora Inclusão';
  DBGrid.Columns[10].Title.Caption := 'Usuário Inclusão';
  DBGrid.Columns[11].Title.Caption := 'Data/Hora Alteração';
  DBGrid.Columns[12].Title.Caption := 'Usuário Alteração';

  DBGrid.Columns[0].Width := 50;
  DBGrid.Columns[1].Width := 150;
  DBGrid.Columns[2].Width := 100;

  DBGrid.Columns[7].Visible := False;
  DBGrid.Columns[8].Visible := False;
  DBGrid.Columns[9].Visible := False;
  DBGrid.Columns[10].Visible := False;
  DBGrid.Columns[11].Visible := False;
  DBGrid.Columns[12].Visible := False;
end;

procedure TForm1.Insert;
var
  c: TDateTime;
begin
  c := now;

  control := TController.Create;
  control.IdValue := StrToInt(EditIdAluno.Text);
  control.NomeValue := EditNomeAluno.Text;
  control.CursoValue := EditCurso.Text;
  control.TurnoValue := EditTurno.Text;
  if EditPeriodo.Text <> '' then
  begin
    control.PeriodoValue := StrToInt(EditPeriodo.Text);
  end;

  control.DataIngressoValue := DateTimePickerIngresso.Date;
  control.SituacaoValue := EditSituacao.Text;
  control.CadeiranteValue := ComboBoxCadeirante.ItemIndex;
  control.DataHoraInclusaoValue := c;
  control.UsuarioInclusaoValue := 'Andriws';
  control.DataHoraAlteracaoValue := c;
  control.UsuarioAlteracaoValue := 'Andriws';
  control.ObservacaoValue := MemoObservacao.Text;

  confirmation := control.Insert;
end;

procedure TForm1.MaterializeEdits;
begin
  control := TController.Create;
  control.Materialize(StrToInt(DataSource1.DataSet.FieldByName('ID_Aluno')
    .AsString));
  EditIdAluno.Text := IntToStr(control.IdValue);
  EditNomeAluno.Text := control.NomeValue;
  EditCurso.Text := control.CursoValue;
  EditTurno.Text := control.TurnoValue;
  EditPeriodo.Text := IntToStr(control.PeriodoValue);
  DateTimePickerIngresso.Date := control.DataIngressoValue;
  EditSituacao.Text := control.SituacaoValue;
  EditUsuarioInclusao.Text := control.UsuarioInclusaoValue;
  EditUsuarioAlteracao.Text := control.UsuarioAlteracaoValue;

  case control.CadeiranteValue of
    0:
      ComboBoxCadeirante.ItemIndex := 2;
    1:
      ComboBoxCadeirante.ItemIndex := 1;
    2:
      ComboBoxCadeirante.ItemIndex := 0;
  end;
  EditDataHoraInclusao.Text := DateTimeToStr(control.DataHoraInclusaoValue);
  EditDataHoraAltecacao.Text := DateTimeToStr(control.DataHoraAlteracaoValue);
  MemoObservacao.Text := control.ObservacaoValue;
end;

procedure TForm1.salvar(opc: integer);
begin
  if opc = 1 then
  begin
    Insert;
  end
  else if opc = 2 then
  begin
    Update;
  end;
end;

procedure TForm1.setId;
var
  newId: integer;
begin
  DBGrid.DataSource.DataSet.Last;
  EditIdAluno.Text := IntToStr(control.setId);
end;

procedure TForm1.Update;
var
  c: TDateTime;
begin
  c := now;
  control := TController.Create;
  control.IdValue := StrToInt(EditIdAluno.Text);
  control.NomeValue := EditNomeAluno.Text;
  control.CursoValue := EditCurso.Text;
  control.TurnoValue := EditTurno.Text;
  if EditPeriodo.Text <> '' then
  begin
    control.PeriodoValue := StrToInt(EditPeriodo.Text);
  end;
  control.DataIngressoValue := DateTimePickerIngresso.Date;
  control.SituacaoValue := EditSituacao.Text;
  control.CadeiranteValue := ComboBoxCadeirante.ItemIndex;
  control.DataHoraAlteracaoValue := c;
  control.UsuarioAlteracaoValue := 'Andriws';
  control.ObservacaoValue := MemoObservacao.Text;

  confirmation := control.Alterar;
end;

end.
