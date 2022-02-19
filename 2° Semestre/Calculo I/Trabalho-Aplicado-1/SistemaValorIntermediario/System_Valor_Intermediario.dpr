program System_Valor_Intermediario;

uses
  Vcl.Forms,
  uFrm_Principal in 'Views\uFrm_Principal.pas' {Frm_Principal},
  Unit1 in 'Utils\Unit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
