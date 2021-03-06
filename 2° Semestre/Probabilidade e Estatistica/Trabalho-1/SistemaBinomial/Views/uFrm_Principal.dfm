object Frm_Funcoes: TFrm_Funcoes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Calcular a F'#243'rmula Binomial'
  ClientHeight = 504
  ClientWidth = 1077
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1077
    Height = 504
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 516
    object Label4: TLabel
      Left = 288
      Top = 103
      Width = 160
      Height = 15
      Caption = 'Selecione o calculo desejado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 70
      Top = 103
      Width = 166
      Height = 15
      Caption = 'Informe os valores de Entrada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 211
      Top = 288
      Width = 95
      Height = 21
      Caption = 'Resultado = '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Btn_Calcular: TBitBtn
      Left = 112
      Top = 283
      Width = 67
      Height = 38
      Caption = 'Calcular'
      Default = True
      TabOrder = 2
      OnClick = Btn_CalcularClick
    end
    object Rdg_Probabilidade: TRadioGroup
      Left = 288
      Top = 124
      Width = 157
      Height = 133
      Caption = 'Prob. Binomial'
      ItemIndex = 0
      Items.Strings = (
        'Individual'
        'Acumulada')
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 472
      Width = 1077
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      Color = 10113846
      ParentBackground = False
      TabOrder = 3
      ExplicitWidth = 516
      object Label16: TLabel
        Left = 8
        Top = 8
        Width = 99
        Height = 15
        Caption = 'Desenvolvido por: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 113
        Top = 9
        Width = 165
        Height = 15
        Caption = 'Andrei Danelli, Gustavo Zanella'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Edit1: TEdit
      Left = 328
      Top = 275
      Width = 75
      Height = 23
      Enabled = False
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 70
      Top = 124
      Width = 156
      Height = 133
      Caption = 'Dados de Entrada'
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 34
        Width = 20
        Height = 15
        Caption = 'N ='
      end
      object Label2: TLabel
        Left = 10
        Top = 66
        Width = 18
        Height = 15
        Caption = 'P ='
      end
      object Label3: TLabel
        Left = 10
        Top = 99
        Width = 18
        Height = 15
        Caption = 'K ='
      end
      object ValorN: TEdit
        Left = 34
        Top = 31
        Width = 57
        Height = 23
        TabOrder = 0
        TextHint = 'Ex: 10'
      end
      object ValorP: TMaskEdit
        Left = 34
        Top = 63
        Width = 56
        Height = 23
        TabOrder = 1
        Text = ''
        TextHint = 'Ex: 0,05'
      end
      object ValorK: TEdit
        Left = 34
        Top = 96
        Width = 57
        Height = 23
        TabOrder = 2
        TextHint = 'Ex: 1'
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 1077
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold, fsItalic]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      ExplicitWidth = 516
      object Label28: TLabel
        Left = 191
        Top = 18
        Width = 146
        Height = 20
        Caption = 'Distribui'#231#227'o Binomial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object EditPorcentual: TMaskEdit
      Left = 328
      Top = 304
      Width = 75
      Height = 23
      Enabled = False
      TabOrder = 6
      Text = ''
    end
    object GroupBox2: TGroupBox
      Left = 488
      Top = 104
      Width = 560
      Height = 153
      Caption = 'Amostra de Calculos'
      TabOrder = 7
      object Label8: TLabel
        Left = 22
        Top = 26
        Width = 70
        Height = 15
        Caption = 'Fatorial de N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 128
        Top = 26
        Width = 69
        Height = 15
        Caption = 'Fatorial de K'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 243
        Top = 26
        Width = 81
        Height = 15
        Caption = 'Subtra'#231#227'o N-K'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 365
        Top = 26
        Width = 83
        Height = 15
        Caption = 'Fatorial de N-K'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 30
        Top = 47
        Width = 40
        Height = 15
        Caption = 'Label12'
      end
      object Label13: TLabel
        Left = 155
        Top = 47
        Width = 40
        Height = 15
        Caption = 'Label13'
      end
      object Label14: TLabel
        Left = 277
        Top = 47
        Width = 40
        Height = 15
        Caption = 'Label14'
      end
      object Label15: TLabel
        Left = 386
        Top = 47
        Width = 40
        Height = 15
        Caption = 'Label15'
      end
      object Label17: TLabel
        Left = 38
        Top = 90
        Width = 30
        Height = 15
        Caption = ' Cn,x '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 45
        Top = 111
        Width = 40
        Height = 15
        Caption = 'Label18'
      end
      object Label19: TLabel
        Left = 144
        Top = 88
        Width = 30
        Height = 15
        Caption = '(p)^x'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 136
        Top = 109
        Width = 42
        Height = 15
        Caption = 'Label20'
      end
      object Label21: TLabel
        Left = 225
        Top = 109
        Width = 40
        Height = 15
        Caption = 'Label21'
      end
      object Label22: TLabel
        Left = 368
        Top = 109
        Width = 42
        Height = 15
        Caption = 'Label22'
      end
      object Label24: TLabel
        Left = 256
        Top = 88
        Width = 54
        Height = 15
        Caption = '(1-p)^n-k'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 101
        Top = 90
        Width = 6
        Height = 15
        Caption = 'x'
      end
      object Label26: TLabel
        Left = 213
        Top = 88
        Width = 6
        Height = 15
        Caption = 'x'
      end
      object Label27: TLabel
        Left = 348
        Top = 88
        Width = 6
        Height = 15
        Caption = 'x'
      end
      object Label23: TLabel
        Left = 400
        Top = 88
        Width = 55
        Height = 15
        Caption = 'Resultado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
end
