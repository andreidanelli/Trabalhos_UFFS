unit uFrm_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Unit1, Vcl.AppAnalytics;

type
  TFrm_Funcoes = class(TForm)
    Panel1: TPanel;
    Btn_Calcular: TBitBtn;
    Rdg_Probabilidade: TRadioGroup;
    Panel2: TPanel;
    Label16: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    ValorN: TEdit;
    Label1: TLabel;
    ValorP: TMaskEdit;
    Label2: TLabel;
    ValorK: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    EditPorcentual: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    procedure Btn_CalcularClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Funcoes: TFrm_Funcoes;

implementation

{$R *.dfm}

procedure TFrm_Funcoes.Btn_CalcularClick(Sender: TObject);
var Resultado_N, Resultado_K, ResultadoNK, Subtracao, N, K, P, Combinacao, Resul, Soma: Double;
var Expoente_1, Expoente_2: Real;
var I, vlrK : Integer;
begin
  if (Trim(ValorN.Text) = '') or (Trim(ValorP.Text) = '') or (Trim(ValorK.Text) = '') then
  begin
    MessageDlg('Obrigatório informar valores!', mtInformation, [mbOK], 0);
    Exit;
  end;

  N := StrToFloat(ValorN.Text);
  P := StrToFloat(ValorP.Text);
  K := StrToFloat(ValorK.Text);
  vlrK := StrToInt(ValorK.Text);

  //**************************************************
  //CALCULAR A PROBABILIDADE INDIVIDUAL
  //**************************************************
  if Rdg_Probabilidade.ItemIndex = 0 then
    begin
      Subtracao := (N - K);
      Resultado_N := Calcular_Fatorial_N(N);
      Resultado_K := Calcular_Fatorial_K(K);
      ResultadoNK := Calcular_Fatorial_Sub(Subtracao);

      Combinacao := (Resultado_N /(Resultado_K * ResultadoNK));
      //1° Expoente(P^k)
      Expoente_1 := Exp(K * ln(P));
      //2° Expoente (1-p)^n-k
      Expoente_2 := Exp((N-K) * ln(1-P));
      //Resultado final
      Resul := Combinacao * Expoente_1 * Expoente_2;

      Edit1.Text := FormatFloat('###,###,##0.0000', Resul);
      EditPorcentual.Text := FormatFloat('###.00"%"', Resul*100);
    end;
  //**************************************************
  //CALCULAR A PROBABILIDADE ACUMULADA
  //**************************************************
  if Rdg_Probabilidade.ItemIndex = 1 then
    begin
      for I := 0 to vlrK do
        begin
          Subtracao := (N - I);
          Resultado_N := Calcular_Fatorial_N(N);
          Resultado_K := Calcular_Fatorial_K(I);
          ResultadoNK := Calcular_Fatorial_Sub(Subtracao);

          Combinacao := (Resultado_N /(Resultado_K * ResultadoNK));

          //1° Expoente(P^k)
          Expoente_1 := Exp(I * ln(P));
          //2° Expoente (1-p)^n-k
          Expoente_2 := Exp((N-K) * ln(1-P));
          //Resultado final
          Resul := Combinacao * Expoente_1 * Expoente_2;

          Soma := Soma + Resul;
        end;
        Edit1.Text := FormatFloat('###,###,##0.0000', Soma);
        EditPorcentual.Text := FormatFloat('###.00"%"', Soma*100);
    end;
  Label12.Caption := FloatToStr(Resultado_N);
  Label13.Caption := FloatToStr(Resultado_K);
  Label14.Caption := FloatToStr(Subtracao);
  Label15.Caption := FloatToStr(ResultadoNK);
  Label18.Caption := FloatToStr(Combinacao);
  label20.Caption := FloatToStr(Expoente_1);
  Label21.Caption := FloatToStr(Expoente_2);
  Label22.Caption := FloatToStr(Resul) ;
end;

procedure TFrm_Funcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
