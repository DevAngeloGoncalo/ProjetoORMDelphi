program ORM;

uses
  Vcl.Forms,
  UCadastroAlunos in 'UCadastroAlunos.pas' {Form1},
  UController in 'UController.pas',
  UFiltragem in 'UFiltragem.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
