object Frm_Principal: TFrm_Principal
  Left = 0
  Top = 0
  Caption = 'Calcular valor intermediario'
  ClientHeight = 425
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI Semibold'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Pnl_Principal: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 425
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 111
      Width = 160
      Height = 20
      Caption = 'Dados de Entrada [a,b]:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 15
      Top = 299
      Width = 35
      Height = 15
      Caption = 'Label3'
      Visible = False
    end
    object Label5: TLabel
      Left = 12
      Top = 278
      Width = 54
      Height = 15
      Caption = 'Seno de A'
      Visible = False
    end
    object Label7: TLabel
      Left = 137
      Top = 280
      Width = 67
      Height = 15
      Caption = 'Expoente_1A'
      Visible = False
    end
    object Label8: TLabel
      Left = 151
      Top = 299
      Width = 35
      Height = 15
      Caption = 'Label8'
      Visible = False
    end
    object Label9: TLabel
      Left = 244
      Top = 280
      Width = 68
      Height = 15
      Caption = 'Expoente_2B'
      Visible = False
    end
    object Label10: TLabel
      Left = 255
      Top = 299
      Width = 40
      Height = 15
      Caption = 'Label10'
      Visible = False
    end
    object Label11: TLabel
      Left = 354
      Top = 280
      Width = 106
      Height = 15
      Caption = 'Resultado Entrada A'
      Visible = False
    end
    object Label12: TLabel
      Left = 386
      Top = 299
      Width = 40
      Height = 15
      Caption = 'Label12'
      Visible = False
    end
    object Label4: TLabel
      Left = 15
      Top = 371
      Width = 35
      Height = 15
      Caption = 'Label4'
      Visible = False
    end
    object Label6: TLabel
      Left = 15
      Top = 352
      Width = 53
      Height = 15
      Caption = 'Seno de B'
      Visible = False
    end
    object Label13: TLabel
      Left = 354
      Top = 352
      Width = 105
      Height = 15
      Caption = 'Resultado Entrada B'
      Visible = False
    end
    object Label14: TLabel
      Left = 244
      Top = 352
      Width = 68
      Height = 15
      Caption = 'Expoente_2B'
      Visible = False
    end
    object Label15: TLabel
      Left = 137
      Top = 352
      Width = 66
      Height = 15
      Caption = 'Expoente_1B'
      Visible = False
    end
    object Label16: TLabel
      Left = 151
      Top = 371
      Width = 40
      Height = 15
      Caption = 'Label16'
      Visible = False
    end
    object Label17: TLabel
      Left = 255
      Top = 371
      Width = 39
      Height = 15
      Caption = 'Label17'
      Visible = False
    end
    object Label18: TLabel
      Left = 386
      Top = 371
      Width = 40
      Height = 15
      Caption = 'Label18'
      Visible = False
    end
    object Label19: TLabel
      Left = 12
      Top = 55
      Width = 61
      Height = 20
      Caption = 'Formula:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 79
      Top = 55
      Width = 151
      Height = 20
      Caption = #55349#56421'^3+'#55349#56416#55349#56402#55349#56411'('#55349#56421')-2+'#55349#56421'^2=0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 190
      Top = 203
      Width = 49
      Height = 15
      Caption = 'Raiz de A'
      Visible = False
    end
    object Label22: TLabel
      Left = 250
      Top = 203
      Width = 48
      Height = 15
      Caption = 'Raiz de B'
      Visible = False
    end
    object Label23: TLabel
      Left = 0
      Top = 409
      Width = 264
      Height = 15
      Caption = 'Desenvolvido por: Andrei Danelli, Gustavo Zanella'
    end
    object Label24: TLabel
      Left = 467
      Top = 409
      Width = 69
      Height = 15
      Caption = 'Agosto/2021'
    end
    object Btn_Calcular: TBitBtn
      Left = 193
      Top = 159
      Width = 102
      Height = 25
      Caption = 'Calcular'
      TabOrder = 0
      OnClick = Btn_CalcularClick
    end
    object Valor_A: TEdit
      Left = 188
      Top = 224
      Width = 53
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object Valor_B: TEdit
      Left = 247
      Top = 224
      Width = 53
      Height = 23
      Enabled = False
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 538
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 3
      object Label21: TLabel
        Left = 69
        Top = 9
        Width = 390
        Height = 25
        Caption = 'Calcular TVI (Teorema do Valor Intermediario)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Entrada_1: TEdit
      Left = 188
      Top = 112
      Width = 53
      Height = 23
      TabOrder = 4
    end
    object Entrada_2: TEdit
      Left = 247
      Top = 112
      Width = 53
      Height = 23
      TabOrder = 5
    end
  end
end
