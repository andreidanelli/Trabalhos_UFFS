# -*- coding: utf-8 -*-
"""lista05_Andrei_Danelli

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1v2g4TWzseTaL4l04VGsBJATnLC1TLhN8

num 1 - Escreva um programa para verificar se um número digitado pelo usuário é primo ou não usando o While.Obs: um número primo é divisível somente por 1 e ele mesmo.
"""

num = int(input("Digite um número inteiro: "))
count = 0
i = 0
while (i <= num):
  i += 1
  x = num % i

  if (x == 0):
    count += 1

if (count <= 2):
  print(f"{num} É um número primo")
else:
  print(f"{num} Não é um número primo")

"""2 - Faça um programa que simule a multiplicação através de adições.  Para tal serão pedidos os dois operandos. Por exemplo se for informado 3 e 4, deverá ser calculado, através de soma, 3*4, ou seja, 12. Este cálculo é feito somando o primeiro valor informado por ele mesmo o número de vezes representada pelo segundo número. 	Nesse exemplo, o três seria somado quatro vezes: 3+3+3+3, resultando 12.



"""

num1 = int(input("Digite o primeiro número: "))
num2 = int(input("Digite o segundo número: "))
soma = 0
i = 0
while (i < num2):
  i += 1
  soma += num1
print("O resultado é:", soma)

"""3 - Antônio tem 1,50m e cresce 2 cm por ano. Carlos tem 1,10m  e  cresce  3 cm  por  ano.  Fazer  um  programa  que calcule quantos anos seriam necess ́arios para que Carlos tivesse  a  mesma  altura  que  Antonio.  Supondo  que  os dois crescem todos os anos.

"""

# Antônio tem 1,50cm - 2cm por ano
# Carlos tem 1,10cm - 3cm por ano
AltAnt = float(1.50)
AltCar = float(1.10)

i = 0
while (AltAnt >= AltCar):
  i += 1
  AltAnt = AltAnt + 0.02
  AltCar = AltCar + 0.03
  
print(f"Será necessário {i} anos, para Carlos ter a mesma altura que Antônio")

"""4 - Faça um programa que leia dois números e um inteiro descrevendo a operação matemática (soma, subtração, multiplicação, divisão). Por exemplo, para operação de soma, o usuário deve informar o número 1. O programa deve rodar indefinidamente até o usuário informar a operação 0

Input: 2 

3

1

Output: 5	

"""

soma = 0
sub = 0
div = 0
mult = 0
operacao = True 

while (operacao):
  print("Digite abaixo uma operação!!\n Digite (1) - Soma \n Digite (2) - Subtração \n Digite (3) - Divisão \n Digite (4) - Multiplicação \n Digite (0) - Finalizar a Operação")
  num1 = float(input("\nDigite o primeiro número: "))
  num2 = float(input("Digite o segundo número: "))
  operacao = int(input("Digite uma operação: "))
  if (operacao == 1):
    soma = num1 + num2
    print(soma)
  elif (operacao == 2):
    sub = num1 - num2
    print(sub)
  elif (operacao == 3):
    div = num1 / num2
    print(div)
  elif (operacao == 4):
    mult = num1 * num2
    print(mult)
  elif (operacao == 0):
    operacao = False
    print("Operação finalizada com sucesso!!!")
  else:
    print("\n !!!Operação Incorreta!!!\n")

"""5 - A Distribuidora de Combustíveis X irá dar um aumento em função da quantidade de combustível comprado anualmente por seus clientes.  Os postos que consomem em média até 100.000 litros de combustível ao mês, terão aumento de 20%. Os postos que consomem acima desta média, 12% de aumento. A distribuidora irá fornecer o nome do posto e seu consumo anual. Calcule e escreva qual será o preço do litro de combustível para o posto, levando-se em conta que hoje a distribuidora cobra R$2.93 por litro.


"""

NomePosto = input("Informe o nome do posto: ")
ConsAnual = float(input("Informe o consumo total de combústivel: "))
ValorLitro = 0

if (ConsAnual <= 100.000):
  ValorLitro = (0.2 * 2.93) + 2.93
  print(f"Preço do Litro reajustado no valor de {ValorLitro:.2f} para o posto ({NomePosto})")
elif (ConsAnual > 100.000):
    ValorLitro = (0.12 * 2.93) + 2.93
    print(f"Preço do Litro reajustado no valor de {ValorLitro:.2f} para o posto ({NomePosto})")