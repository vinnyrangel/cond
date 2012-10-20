## Helpers

* meu_condominio: retorna o condominio do usuário que está logado (um usuário só pode pertencer a um condominio por vez)

## Fluxo

### Páginas/Anuncios

* são relacionadas a um condominio (ex: aviso a todos prédios) ou a um predio apenas
* nao podem ser comentados

### Mural

* é relacionado a um prédio

### Servicos

* Devem estar associados a N condominios|prédios, deve ser acessado de duas formas :

>1 -  ao buscar por (exemplo) "delivery recreio comida chinesa" deve cair em uma página com informações do serviço (conteúdo indexado)

> **possíveis urls:**

>* http://[nome-do-site]/rj/recreio/delivery/comida-chinesa/china-in-box/
>* http://[nome-do-site]/rj/copacabana/pet-shop/pet-do-bred/

>2 - um morador do recreio, ao acessar o sistema, na opção 'comida chinesa' deverá ver o serviço


==========================================================================================


## Opções de privacidade

### Usuário
* boolean - aparecer na listagem de moradores do predio
* boolean - exibir nome/email publicamente


### Condominio/Predio
* boolean - Moderação, apenas usuários aceitos pelo sindico/admin poderão visualizar|criar conteúdo
* boolean - Apenas moradores podem ver informações do prédio

### Servicos/Anunciantes
* Público


==========================================================================================

## Recursos Usuario

* a = Usuario.first

* a.apartamento
* a.apartamento.numero

* a.apartamento.predio
* a.apartamento.predio.nome

* a.apartamento.predio.condominio
* a.apartamento.predio.condominio.nome

==========================================================================================

## Autenticação
*Após rodar o seed, já terá disponível 4 níveis de usuário para autenticar:*

* admin (email: user1@email.com / pass: abc123)
* morador (email: user2@email.com / pass: abc123)
* sindico (email: user3@email.com / pass: abc123)
* anunciante (email: user4@email.com / pass: abc123)

Campos obrigatórios para cadastro de usuários: **email e senha**

==========================================================================================

### Formato urls:

* condominios/[nome-condominio]/predios/[nome-predio]

==========================================================================================

### Uploads de imagens :

Precisa instalar: **brew install imagemagick**

==========================================================================================
## Heroku:

**depois do bundle install**

* heroku keys:add

**adicione o repositório do heroku ao projeto**

* git remote add heroku git@heroku.com:condomo.git

**comandos:**

* deploy : git push heroku master
* console: heroku run console
* tasks : heroku run rake db:migrate
* acessar: heroku open
* info: heroku config

url: **http://condomo.herokuapp.com/**

==========================================================================================