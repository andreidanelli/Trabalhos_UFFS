program Sistema_Binomial;

uses
  Vcl.Forms,
  uFrm_Principal in 'Views\uFrm_Principal.pas' {Frm_Funcoes},
  Unit1 in 'Utils\Unit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Funcoes, Frm_Funcoes);
  Application.Run;
end.
