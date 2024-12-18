unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.Mask, DateUtils;

//Declarando as Fun��es
function Calcular_Fatorial_N(N : Double): Double;
function Calcular_Fatorial_K(K : Double): Double;
function Calcular_Fatorial_Sub(Subtracao : Double) : Double;
//function Calcular_Expoente(P, X : Double): Real;

implementation
//-------------------------------------------------------

//<------------CALCULO DE COMBINA��ES C(n,k)------------>

//-------------------------------------------------------

//Fun��o para Calcular o fatorial de N
function Calcular_Fatorial_N(N : Double): Double;
begin
  if N = 0 then
    Result := 1
  else
    Result := N * Calcular_Fatorial_N(N - 1);
end;

//Fun��o para Calcular o fatorial de X
function Calcular_Fatorial_K(K : Double) : Double;
begin
  if K = 0 then
    Result := 1
  else
    Result := K * Calcular_Fatorial_K(K - 1);
end;

//Fun��o para Calcular o Fatorial da Subtracao
function Calcular_Fatorial_Sub(Subtracao : Double) : Double;
begin
  if Subtracao = 0 then
    Result := 1
  else
    Result := Subtracao * Calcular_Fatorial_Sub(Subtracao - 1);
end;

end.
