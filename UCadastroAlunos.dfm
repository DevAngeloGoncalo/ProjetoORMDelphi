object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 363
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 579
    Height = 308
    ActivePage = Cadastro
    Align = alClient
    TabOrder = 0
    TabStop = False
    object Listagem: TTabSheet
      Caption = 'Listagem'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        571
        280)
      object DBGrid: TDBGrid
        Left = 3
        Top = 104
        Width = 565
        Height = 174
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DataSource1
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 571
        Height = 98
        Align = alTop
        Caption = 'Filtros'
        TabOrder = 1
        DesignSize = (
          571
          98)
        object Label12: TLabel
          Left = 3
          Top = 33
          Width = 18
          Height = 13
          Caption = 'ID: '
        end
        object Label13: TLabel
          Left = 79
          Top = 33
          Width = 34
          Height = 13
          Caption = 'Nome: '
        end
        object Label14: TLabel
          Left = 241
          Top = 33
          Width = 35
          Height = 13
          Caption = 'Curso: '
        end
        object Label15: TLabel
          Left = 410
          Top = 33
          Width = 43
          Height = 13
          Caption = 'Per'#237'odo: '
        end
        object Label16: TLabel
          Left = 488
          Top = 33
          Width = 48
          Height = 13
          Caption = 'Situa'#231#227'o: '
        end
        object EditFiltroCurso: TEdit
          Left = 275
          Top = 30
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object EditFiltroId: TEdit
          Left = 20
          Top = 30
          Width = 37
          Height = 21
          NumbersOnly = True
          TabOrder = 0
        end
        object EditFiltroNome: TEdit
          Left = 112
          Top = 30
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object EditFiltroPeriodo: TEdit
          Left = 452
          Top = 30
          Width = 25
          Height = 21
          NumbersOnly = True
          TabOrder = 3
        end
        object EditFiltroSituacao: TEdit
          Left = 535
          Top = 30
          Width = 25
          Height = 21
          MaxLength = 1
          TabOrder = 4
        end
        object Panel1: TPanel
          Left = -1
          Top = 57
          Width = 569
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          object ButDetalhes: TButton
            Left = 187
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Detalhes'
            TabOrder = 1
            OnClick = ButDetalhesClick
          end
          object ButFiltrar: TButton
            Left = 26
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Filtrar'
            TabOrder = 0
            OnClick = ButFiltrarClick
          end
          object ButLimparFiltros: TButton
            AlignWithMargins = True
            Left = 345
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Limpar'
            TabOrder = 2
            OnClick = ButLimparFiltrosClick
          end
        end
      end
    end
    object Cadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 3
        Top = 27
        Width = 40
        Height = 13
        Caption = 'Id Aluno'
      end
      object Label2: TLabel
        Left = 3
        Top = 51
        Width = 57
        Height = 13
        Caption = 'Nome Aluno'
      end
      object Label3: TLabel
        Left = 3
        Top = 75
        Width = 28
        Height = 13
        Caption = 'Curso'
      end
      object Label4: TLabel
        Left = 3
        Top = 123
        Width = 28
        Height = 13
        Caption = 'Turno'
      end
      object Label5: TLabel
        Left = 3
        Top = 99
        Width = 36
        Height = 13
        Caption = 'Per'#237'odo'
      end
      object Label6: TLabel
        Left = 1
        Top = 195
        Width = 68
        Height = 13
        Caption = 'Data Ingresso'
      end
      object Label7: TLabel
        Left = 3
        Top = 146
        Width = 41
        Height = 13
        Caption = 'Situa'#231#227'o'
      end
      object Label8: TLabel
        Left = 0
        Top = 170
        Width = 53
        Height = 13
        Caption = 'Cadeirante'
      end
      object Label10: TLabel
        Left = 364
        Top = 27
        Width = 77
        Height = 13
        Caption = 'Usuario inclus'#227'o'
      end
      object Label11: TLabel
        Left = 357
        Top = 54
        Width = 84
        Height = 13
        Caption = 'Usuario altera'#231#227'o'
      end
      object Label17: TLabel
        Left = 348
        Top = 81
        Width = 93
        Height = 13
        Caption = 'Data/Hora Inclus'#227'o'
      end
      object Label18: TLabel
        Left = 342
        Top = 106
        Width = 99
        Height = 13
        Caption = 'Data/Hora Altera'#231#227'o'
      end
      object Label19: TLabel
        Left = 342
        Top = 138
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object ButCadastroVoltar: TButton
        Left = 495
        Top = 252
        Width = 75
        Height = 25
        Caption = 'Voltar'
        TabOrder = 10
        OnClick = ButCadastroVoltarClick
      end
      object EditCurso: TEdit
        Left = 72
        Top = 72
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object EditIdAluno: TEdit
        Left = 72
        Top = 24
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object EditNomeAluno: TEdit
        Left = 72
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EditSituacao: TEdit
        Left = 72
        Top = 143
        Width = 121
        Height = 21
        MaxLength = 1
        TabOrder = 5
      end
      object EditUsuarioInclusao: TEdit
        Left = 447
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object EditUsuarioAlteracao: TEdit
        Left = 447
        Top = 51
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object EditTurno: TEdit
        Left = 72
        Top = 120
        Width = 121
        Height = 21
        MaxLength = 1
        TabOrder = 4
      end
      object EditPeriodo: TEdit
        Left = 72
        Top = 96
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object DateTimePickerIngresso: TDateTimePicker
        Left = 72
        Top = 191
        Width = 121
        Height = 21
        Date = 44225.618625092590000000
        Time = 44225.618625092590000000
        TabOrder = 7
      end
      object ComboBoxCadeirante: TComboBox
        Left = 72
        Top = 167
        Width = 121
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        Items.Strings = (
          'Indefinido'
          'Cadeirante'
          'N'#227'o-cadeirante')
      end
      object EditDataHoraInclusao: TEdit
        Left = 447
        Top = 78
        Width = 121
        Height = 21
        TabOrder = 11
      end
      object EditDataHoraAltecacao: TEdit
        Left = 447
        Top = 103
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object MemoObservacao: TMemo
        Left = 342
        Top = 157
        Width = 226
        Height = 89
        Lines.Strings = (
          'MemoObservacao')
        TabOrder = 13
      end
    end
  end
  object Painel: TPanel
    Left = 0
    Top = 308
    Width = 579
    Height = 55
    Align = alBottom
    TabOrder = 1
    object ButIncluir: TButton
      Left = 56
      Top = 16
      Width = 49
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = ButIncluirClick
    end
    object ButAlterar: TButton
      Left = 127
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = ButAlterarClick
    end
    object ButSalvar: TButton
      Left = 199
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = ButSalvarClick
    end
    object ButCancelar: TButton
      Left = 274
      Top = 16
      Width = 49
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = ButCancelarClick
    end
    object ButExcluir: TButton
      Left = 349
      Top = 16
      Width = 51
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = ButExcluirClick
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 524
    Top = 16
  end
end
