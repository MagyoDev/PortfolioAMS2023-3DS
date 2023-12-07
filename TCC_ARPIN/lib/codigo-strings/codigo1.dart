class Codigos{
final String text1 = 
"""
# Exemplo de código para fazer um buzzer funcionar com Arduino:

```arduino
int pinoBuzzer = 9;
```
Este comando define o pino do buzzer.

```arduino
void setup() {

  pinMode(pinoBuzzer, OUTPUT);
}
```

Nesta linha, o pino do buzzer é inicializado como saída.

```arduino
void loop() {
  // Gera um som de buzina curto
  tone(pinoBuzzer, 1000); // Frequência de 1000Hz
  delay(500);  // Aguarda meio segundo
  noTone(pinoBuzzer); // Desliga o buzzer
  delay(500);  // Aguarda meio segundo
}
```

Neste bloco de comandos, faremos o buzzer emitir um som em uma determinada frequência de Hz (Hertz) e definiremos o intervalo da emissão do som.

Agora, vamos explicar o código linha por linha:
1.	`int pinoBuzzer = 9;`: Esta linha declara uma variável pinoBuzzer e atribui o valor 9 a ela, que é o pino que estamos usando para conectar o buzzer. Você pode escolher outro pino se desejar.
2.	`void setup() {}`: A função setup() é executada uma vez no início do programa e é usada para inicializar as configurações iniciais.
3.	`pinMode(pinoBuzzer, OUTPUT);`: Configura o pino definido para o buzzer como saída, indicando que ele será usado para gerar um som.
4.	`void loop() {}`: A função loop() é executada continuamente após o setup() e é onde a lógica principal para controlar o buzzer é implementada.
5.	`tone(pinoBuzzer, 1000);`: Usa a função tone() para gerar um som no buzzer conectado ao pinoBuzzer com uma frequência de 1000Hz (1kHz). Isso produzirá um som contínuo no buzzer.
6.	`delay(500);`: Aguarda meio segundo (500 milissegundos).
7.	`noTone(pinoBuzzer);`: Usa a função noTone() para desligar o som no buzzer. O buzzer ficará em silêncio após essa chamada.
8.	`delay(500);`: Aguarda meio segundo (500 milissegundos) antes de repetir o ciclo para gerar um som curto novamente.
Neste código, estamos gerando um som contínuo no buzzer com uma frequência de 1kHz por meio da função tone(). Em seguida, paramos o som com a função noTone() e aguardamos um curto período de tempo antes de repetir o ciclo. Você pode personalizar a frequência e a duração do som alterando os valores na função tone() e nos comandos delay() para criar diferentes padrões sonoros.



"""; 

final String text2 = 
"""
# Exemplo de código para simular um semáforo com Arduino:

```arduino
int pinoVermelho = 9;
int pinoAmarelo = 10;
int pinoVerde = 11;
```

Estes comandos definem os pinos para os LEDs do semáforo.

```arduino
void setup() {
  
  pinMode(pinoVermelho, OUTPUT);
  pinMode(pinoAmarelo, OUTPUT);
  pinMode(pinoVerde, OUTPUT);
}
```

Neste bloco de comandos, inicializamos os pinos dos LEDs como saídas.

```arduino
void loop() {
 // Liga o LED vermelho (sinal de pare)
  digitalWrite(pinoVermelho, HIGH);
  digitalWrite(pinoAmarelo, LOW);
  digitalWrite(pinoVerde, LOW);
  delay(3000);  // Aguarda 3 segundos

  // Liga o LED amarelo (preparando para a próxima etapa)
  digitalWrite(pinoVermelho, LOW);
  digitalWrite(pinoAmarelo, HIGH);
  digitalWrite(pinoVerde, LOW);
  delay(1000);  // Aguarda 1 segundo

  // Liga o LED verde (sinal de siga em frente)
  digitalWrite(pinoVermelho, LOW);
  digitalWrite(pinoAmarelo, LOW);
  digitalWrite(pinoVerde, HIGH);
  delay(3000);  // Aguarda 3 segundos

  // Liga o LED amarelo piscando (sinal de atenção)
  digitalWrite(pinoVermelho, LOW);
  digitalWrite(pinoAmarelo, LOW);
  digitalWrite(pinoVerde, LOW);
  delay(500);  // Aguarda meio segundo
  digitalWrite(pinoAmarelo, LOW);
  delay(500);  // Aguarda meio segundo
}
```

O comando digitalWrite Liga o LED, o comando delay define o intervalo de tempo em que o led liga ou desliga, sendo High para ligar e Low para desligar, seguido do comando  para ligar o LED vermelho (sinal de pare), os outros LEDS ficam desligados, seguido dos comandos para ligar o LED amarelo, nesta etapa, os LEDS vermelho e verde não são acionados, na sequência, é acionado o LED verde, somente o LED verde é acionado, e por último, o LED amarelo irá piscar em intervalos, sinalizando atenção.

Agora, vamos explicar o código linha por linha:
1.	`int pinoVermelho = 9;`, int pinoAmarelo = 10;, int pinoVerde = 11;: São declarações de variáveis que associam os números dos pinos do Arduino aos LEDs de um semáforo. No exemplo, usamos os pinos 9, 10 e 11, mas você pode escolher pinos diferentes se desejar.
2.	`void setup() {}`: A função setup() é executada uma vez no início do programa e é usada para inicializar as configurações iniciais.
3.	`pinMode(pinoVermelho, OUTPUT);`, pinMode(pinoAmarelo, OUTPUT);, pinMode(pinoVerde, OUTPUT);: Configura os pinos definidos para os LEDs como saídas, indicando que eles serão usados para controlar os LEDs.
4.	`void loop() {}`: A função loop() é executada continuamente após o setup() e é onde a lógica principal do semáforo é implementada.
5.	`digitalWrite(pinoVermelho, HIGH);, digitalWrite(pinoAmarelo, LOW);, digitalWrite(pinoVerde, LOW);`: Liga o LED vermelho (sinal de "Pare") e desliga os LEDs amarelo e verde. O semáforo fica nessa condição por 3 segundos.
6.	`digitalWrite(pinoVermelho, LOW);, digitalWrite(pinoAmarelo, HIGH);, digitalWrite(pinoVerde, LOW);`: Liga o LED amarelo (preparando para a próxima etapa) e desliga os LEDs vermelho e verde. O semáforo fica nessa condição por 1 segundo.
7.	`digitalWrite(pinoVermelho, LOW);, digitalWrite(pinoAmarelo, LOW);, digitalWrite(pinoVerde, HIGH);`: Liga o LED verde (sinal de "Siga em frente") e desliga os LEDs vermelho e amarelo. O semáforo fica nessa condição por 3 segundos.
8.	`digitalWrite(pinoVermelho, LOW);, digitalWrite(pinoAmarelo, LOW);, digitalWrite(pinoVerde, LOW);`: Desliga todos os LEDs, simulando um estado de atenção piscando. O semáforo fica nessa condição, alternando entre os estados baixo e alto a cada 0,5 segundos.

Este código é uma representação simples de um semáforo. Você pode personalizá-lo ou adicionar mais funcionalidades, como sensores para detecção de veículos ou temporizadores para ajustar os tempos de exibição de cada sinal.


""";

final String text3 = 
"""
Exemplo de código para ligar e desligar um LED:

 ```arduino
 int pinoLED = 13;
 ```

Este comando define o pino digital onde o LED está conectado.

```arduino
void setup() {
  
  pinMode(pinoLED, OUTPUT);
}
```

Nesta linha, inicializamos o pino do LED como uma saída.

```arduino
void loop() {
 
  digitalWrite(pinoLED, HIGH);
  delay(1000); // Espera por 1 segundo (1000 milissegundos)

  // Desliga o LED
  digitalWrite(pinoLED, LOW);
  delay(1000); // Espera por 1 segundo (1000 milissegundos)
}
```

O comando digitalWrite Liga o LED, o comando delay define o intervalo de tempo em que o led liga ou desliga, sendo High para ligar e Low para desligar.

Agora, vamos explicar o código linha por linha:
1.	`int pinoLED = 13;`: Declara uma variável inteira chamada pinoLED e atribui o valor 13. Isso define o pino digital do Arduino ao qual o LED está conectado.
2.	`void setup() {}`: O Arduino executa o código dentro da função setup() uma vez no início. Esta função é usada para inicializar configurações.
3.	`pinMode(pinoLED, OUTPUT);`: Configura o pino definido como pinoLED como uma saída, indicando que ele será usado para controlar um dispositivo externo, como um LED.
4.	`void loop() {}`: O Arduino executa o código dentro da função loop() repetidamente após o setup() terminar. Esta é a parte principal do programa, onde a lógica do projeto é implementada.
5.	`digitalWrite(pinoLED, HIGH);`: Define o pino pinoLED como HIGH (alto), ligando o LED. Quando o pino está configurado como HIGH, ele fornece uma tensão positiva.
6.	`delay(1000);`: Espera por 1000 milissegundos (1 segundo) antes de continuar para o próximo comando. Isso mantém o LED ligado por 1 segundo.
7.	`digitalWrite(pinoLED, LOW);`: Define o pino pinoLED como LOW (baixo), desligando o LED. Quando o pino está configurado como LOW, ele fornece uma tensão zero.
8.	`delay(1000);`: Espera por mais 1000 milissegundos (1 segundo) antes de continuar para o próximo comando. Isso mantém o LED desligado por 1 segundo.
O ciclo se repete indefinidamente, ligando e desligando o LED a cada segundo. Isso cria um efeito de piscar. O conceito principal aqui é o uso das funções digitalWrite() para controlar a saída de um pino digital e a função delay() para criar pausas. Este é um exemplo simples de como você pode controlar componentes eletrônicos usando o Arduino.


"""; 



}