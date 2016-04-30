
## Projeto em Prolog para auxiliar o ensino e aprendizagem de Geografia do Brasil.
###### Atividade acadêmica [IABV 2016]
Marcelo Barbosa [@github/marcelobns](https://github.com/marcelobns)

# Instalação
Para a utilização deste projeto você primeiro deve instalar a versão mais recente do [swi-prolog](http://www.swi-prolog.org/Download.html).

Qualquer dúvida ou problemas na instalação do swi-prolog consulte a [documentação](http://www.swi-prolog.org/pldoc/doc_for?object=manual).

Então faça o [download](https://github.com/marcelobns/prolog_quiz/archive/master.zip) deste projeto ou clone-o em sua máquina :
```
$ git clone https://github.com/marcelobns/prolog_quiz.git
```
Em seu terminal do prolog ou na ferramenta swipl dentro do terminal do seu sistema operacional, Selecione o arquivo principal do projeto "server.pl" e inicie o servidor web do prolog na porta que for mais conveniente :
```
$ consult('prolog_quiz/server.pl').
$ server(88).
```
pronto! seu servidor está rodando em: [http://localhost:88](http://localhost:88)

# Uso
##### A interface é simples e intuitiva, contendo um formulário para responder as perguntas sobre geografia do Brasil.
![form](web/img/doc/form.png)
##### E ao final de cada rodada de perguntas é exibido uma tela com o resultado.
![result](web/img/doc/result.png)

# Manuteção
