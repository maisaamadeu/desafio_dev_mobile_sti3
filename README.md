# Desafio Dev Mobile - Flutter

Neste desafio técnico realizei a criação de um aplicativo de gerenciamento de pedidos. O objetivo principal era consumir uma API que retornasse uma lista de pedidos e armazená-los localmente utilizando um banco de dados para exibição e manipulação. Além das funcionalidades básicas solicitadas, o projeto inclui uma funcionalidade extra de gráficos para melhor visualização dos dados, uma adição que considerei crucial para a compreensão das informações pelos usuários.

“Os programadores não são aqueles que escrevem códigos perfeitos, mas sim aqueles que sabem como corrigir os erros.”

~ Barbara Liskov

# Tecnologias e Arquitetura Utilizadas

- Arquitetura: O projeto foi estruturado com base na Clean Architecture, utilizando o padrão MVVM (Model-View-ViewModel) para separação de responsabilidades e organização do código.
- Gerenciamento de Estado: Foi utilizado o GetX para o gerenciamento de estado, proporcionando uma maneira eficiente de controlar as interações entre as camadas do projeto e atualizações da interface de usuário.
- Requisições HTTP: Um cliente HTTP personalizado foi implementado para realizar as requisições à API, oferecendo mais controle sobre o tratamento de erros e personalizações no envio e recebimento de dados.
- Persistência de Dados: A persistência foi realizada com o Hive, um banco de dados local rápido e fácil de usar, que armazena os dados retornados pela API para serem exibidos nas telas.
- Injeção de Dependências: Utilizamos o GetIt para gerenciar a injeção de dependências, facilitando a modularização e tornando o código mais escalável e testável.

# Funcionalidades Principais

### Tela Inicial
A tela inicial do aplicativo exibe um menu lateral contendo as opções "Pedidos", "Relatórios" e "Gráficos". Ao clicar em cada uma dessas opções, o usuário será direcionado para a página correspondente.

### Tela de Pedidos

A tela de pedidos contém um botão "Consultar" que faz a chamada à API para buscar a lista de pedidos.
Os dados dos pedidos são armazenados localmente no banco de dados para serem exibidos na tabela, que contém as seguintes colunas:

- Número do Pedido
- Data
- Cliente
- Status
- Valor Total

Cada item da lista corresponde a um pedido de um cliente, com um ou mais produtos e parcelas associadas.  
Ao clicar uma vez em um item da lista, a coluna lateral exibe detalhes do pedido selecionado, incluindo informações do cliente, endereço de entrega e status.  
Ao clicar duas vezes em um item ou no botão "Ver Detalhes" da coluna lateral, uma modal é aberto mostrando os dados dos produtos e parcelas correspondentes ao pedido selecionado.  

### Tela de Relatórios

A tela de relatórios oferece uma visão mais ampla dos dados armazenados, com foco em totalizações e estatísticas.  
Combobox de Seleção: O usuário pode escolher o tipo de relatório que deseja visualizar, como:

- Produtos Mais Vendidos: Exibe os produtos com maior volume de vendas.
- Formas de Pagamento por Dia: Detalha as formas de pagamento utilizadas em cada dia.
- Totalização de Vendas por Cidade: Exibe a distribuição de vendas por diferentes cidades.
- Vendas por Faixa Etária: Mostra a quantidade de vendas e o valor total por faixa etária dos clientes.

### Tela de Gráficos

Adicionei uma funcionalidade extra de gráficos ao projeto para enriquecer a visualização dos dados dos relatórios, mesmo que essa funcionalidade não tenha sido solicitada no desafio original. Os gráficos implementados são:

- Top Produtos: Um gráfico de pizza que exibe os cinco produtos mais vendidos, com uma legenda que identifica diferentes itens, como camisetas, tênis, jaquetas e bonés.
- Top Vendas: Um gráfico de barras que mostra os cinco clientes com os maiores valores de compra.
- Pedidos: Um gráfico de barras que ilustra a quantidade de pedidos, separando-os entre aprovados e cancelados.

# Teste o Aplicativo Facilmente
Se você possui um dispositivo Android e deseja simplesmente experimentar o funcionamento do aplicativo sem precisar examinar o código-fonte, siga estas etapas:

1 Baixe o Aplicativo:

- Antes de explorar qualquer pasta no GitHub, localize o arquivo "app-release.apk".
- Faça o download do arquivo APK diretamente para o seu dispositivo Android.

2 Instalação Simples:

- Após o download, abra o arquivo "app-release.apk".
- Siga as instruções para instalar o aplicativo em seu dispositivo.

3 Teste o Funcionamento:

- Abra o aplicativo recém-instalado.
- Explore as funcionalidades conforme especificado nas instruções do desafio.

# Pré-requisitos
Este projeto foi desenvolvido utilizando o Dart SDK na versão 3.4.3 e o Flutter SDK na versão 3.22.2. Recomendo que você utilize essas versões ou superiores para garantir compatibilidade ao testar o aplicativo e evitar possíveis problemas de versão durante a execução do projeto. Você pode baixar e aprender a como configurar o Dart SDK no <a href="https://dart.dev/get-dart" target="_blank">site oficial do Dart</a> e o Flutter SDK no <a href="https://docs.flutter.dev/get-started/install" target="_blank">site oficial do Flutter</a>. 

# Como Executar o Projeto
### Baixar o Projeto:
Baixe o projeto do repositório no GitHub para uma pasta no seu computador. Você pode fazer isso clicando no botão "Code" e escolhendo a opção de download, ou executando o seguinte comando em um terminal:
```
git clone https://github.com/maisaamadeu/desafio_dev_mobile_sti3
```

### Abrir no VSCode:
Abra a pasta do projeto no Visual Studio Code (VSCode). Certifique-se de ter a extensão do Dart e do Flutter instalada no VSCode.

### Selecione um Dispositivo
Antes de executar o projeto, é fundamental escolher um dispositivo para visualizar o aplicativo. Dado que se trata de um aplicativo mobile, você tem duas opções:

#### Emulador:

- Selecione um emulador apropriado para a plataforma desejada (Android ou iOS).
- Inicie o emulador antes de executar o aplicativo.

#### Dispositivo Físico:

- Conecte seu dispositivo móvel ao computador.
- Certifique-se de que o dispositivo tenha a depuração USB ativada.
- Selecione o dispositivo conectado como alvo para a execução do aplicativo.

### Executar o Projeto:
No VSCode, pressione as seguintes teclas:
```
CRTL + F5
```
Ou clique no botão que aparece no canto superior direito quando você está no arquivo main:
![image](https://github.com/maisaamadeu/desafio_tecnico_2/assets/84193929/9f4bc594-89ce-4041-9c4d-b9805daf6201)

### O aplicativo será buildado e uma versão será instalada e aberta no dispositivo escolhido 🙂
