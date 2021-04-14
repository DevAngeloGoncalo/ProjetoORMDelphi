program ORM;

uses
  Vcl.Forms,
  UCadastroAlunos in 'UCadastroAlunos.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  UController in 'Classes\UController.pas',
  UFiltragem in 'Classes\UFiltragem.pas',
  UORMAluno in 'Classes\UORMAluno.pas',
  UORMGeral in 'Classes\UORMGeral.pas',
  UTiposMelhorados in 'Classes\UTiposMelhorados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
