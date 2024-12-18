unit uFrm_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Math;

type
  TFrm_Principal = class(TForm)
    Pnl_Principal: TPanel;
    Entrada_1: TEdit;
    Entrada_2: TEdit;
    Label2: TLabel;
    Btn_Calcular: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Valor_A: TEdit;
    Valor_B: TEdit;
    Panel1: TPanel;
    Label21: TLabel;
    Label1: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    procedure Btn_CalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation


{$R *.dfm}

procedure TFrm_Principal.Btn_CalcularClick(Sender: TObject);
var
  Seno_A, Seno_B : String;
  Expoente_1A, Expoente_2A, Valor1, Valor2, Soma_A, Soma_B, Expoente_1B, Expoente_2B : Double;

begin

  if (Entrada_1.Text = '') or (Entrada_2.Text = '') then
    begin
      MessageDlg('Favor informar os valores.', mtInformation, [mbOK], 0);
      Exit;
    end
  else
    begin
      //Formula2
      //x^3 + sen(x) -2 + x^2 = 0

      //Calculando primeira entrada;
      Seno_A := FloatToStr(sin(DegToRad(StrToFloat(Entrada_1.Text))));
      Valor1 := StrToFloat(Entrada_1.Text);

      Expoente_1A := Power(Valor1, 3);
      Expoente_2A := Power(Valor1, 2);

      Soma_A := Expoente_1A + (StrToFloat(Seno_A)-2) +  Expoente_2A;

      label3.Caption := Seno_A;
      Label8.Caption := FloatToStr(Expoente_1A);
      Label10.Caption := FloatToStr(Expoente_2A);
      Label12.Caption := FloatToStr(Soma_A);
      Valor_A.Text := FormatFloat('###,###,##0.0', Soma_A);

      //calculando segunda entrada;
      Seno_B := FloatToStr(sin(DegToRad(StrToFloat(Entrada_2.Text))));
      Valor2 := StrToFloat(Entrada_2.Text);

      Expoente_1B := Power(Valor2, 3);
      Expoente_2B := Power(Valor2, 2);

      Soma_B := Expoente_1B + (StrToFloat(Seno_B)-2) +  Expoente_2B;

      Label4.Caption := Seno_B;
      Label16.Caption := FloatToStr(Expoente_1B);
      Label17.Caption := FloatToStr(Expoente_2B);
      Label18.Caption := FloatToStr(Soma_B);
      Valor_B.Text := FormatFloat('###,###,##0.0', Soma_B);

    //Verificando se as Raizes de F(a) e F(b) s�o maiores que 0 e menores que 0;
      if (Soma_B > 0) and (Soma_A < 0) then
        begin
          ShowMessage('A equa��o tem pelo menos uma solu��o neste intervalo ');
        end
      else if (Soma_B < 0) and (Soma_A > 0) then
        begin
          ShowMessage('A equa��o tem pelo menos uma solu��o neste intervalo');
        end
      else if (Soma_B > 0) and (Soma_A > 0)then
        begin
          ShowMessage('N�o � poss�vel afirmar que existe solu��o neste intervalo, tente outros dois n�meros');
        end
      else if (Soma_B < 0) and (Soma_A < 0) then
        begin
          ShowMessage('N�o � poss�vel afirmar que existe solu��o neste intervalo, tente outros dois n�meros');
        end;

      Entrada_1.Clear;
      Entrada_2.Clear;
    end;

end;

procedure TFrm_Principal.FormShow(Sender: TObject);
begin
  Entrada_1.SetFocus;
end;

end.
