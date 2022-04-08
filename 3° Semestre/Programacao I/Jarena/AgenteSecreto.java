package br.uffs.cc.jarena;

public class AgenteSecreto extends Agente {

    public int ContadorAgente;
    public int ContadorAgenteAux;

    public AgenteSecreto(Integer x, Integer y, Integer energia) {
		super(0, 0, energia);
		setDirecao(geraDirecaoAleatoria());
        ContadorAgente = 0;
        ContadorAgenteAux = 5;
	}

    @Override
    public void pensa() {
        ContadorAgente++;

        //Vai distribuindo os agentes para a direita na posição para baixo
        if(ContadorAgente == 8) {
            setDirecao(DIREITA);
        }
        //Utilizado para espalhar os agentes no mapa
        if((ContadorAgente % 4) == 0) {
            if(ContadorAgenteAux <= 500) {
                if(getId() == ContadorAgenteAux && getX() > 10) {
                    setDirecao(BAIXO); 
                    System.out.println("Estou indo para baixo");
                }
                ContadorAgenteAux++;
            }
        }
        //Caso o agente bate na parede
        if(!podeMoverPara(getDirecao())) {
            setDirecao(geraDirecaoAleatoria());
            System.out.println("Bati na parede, alterando direção!");
        }
    }

    @Override
    public void recebeuEnergia() {
        para();

        //Utilizado para ficar parado dentro de um intervalo de 10 tempos, após isso anda em direção aleatória
        if(isParado() == true) {
            ContadorAgente = 1;
            ContadorAgente++;
            if(ContadorAgente == 10) {
                System.out.println(ContadorAgente);
                setDirecao(geraDirecaoAleatoria());
                System.out.println("Correndo atras de ++++ energia");
            }
        }
        //Verifica se a energia está boa o suficiente para dividir mais agentes
        if(podeDividir() && getEnergia() >= 1000){
            divide();
            setDirecao(geraDirecaoAleatoria());
        }
    }

    @Override
    public void tomouDano(int energiaRestanteInimigo) {
        // TODO Auto-generated method stub
    }

    @Override
    public void ganhouCombate() {
       System.out.println("Ganhei essa luta injusta!");
    }

    @Override
    public void recebeuMensagem(String msg) {

    }

    @Override
    public String getEquipe() {
        // TODO Auto-generated method stub
        return "Agente Secreto";
    }

}