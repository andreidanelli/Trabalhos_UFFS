unit uFrm_Funcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.Mask, DateUtils;

function Calcular_Fatorial_N(N : Integer): Integer;


implementation


//Função para Calcular o fatorial de N
function Calcular_Fatorial_N(N : Integer): Integer;
begin
  if N = 0 then
    Result := 1
  else
    Result := N * Calcular_Fatorial_N(N - 1);
end;
end.
