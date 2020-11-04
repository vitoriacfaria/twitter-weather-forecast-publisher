# Twitter Weather Forecast Publisher

Esse projeto tem como objetivo publicar no [Twitter](https://twitter.com/) a temperatura do dia atual acompanhado da previsão dos próximos 5 dias, integrando a API do [OpenWeatherMap](https://openweathermap.org/).

## Índices 

* [Inicialização do projeto](#inicialização-do-projeto)
  * [Versões de dependências](#versões-de-dependências)
  * [Credentials](#credentials)
  * [Setup inicial](#setup-inicial)
* [Endpoint Principal](#endpoint-principal)
* [Contribuição](#contribuição)

### Inicialização do projeto

#### Versões de dependências
  * Ruby [vs2.7.0](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/) 
  * Ruby on Rails [vs6.0.3](https://rubygems.org/gems/rails)

O rails faz dependência com banco de dados, no caso do projeto está sendo usado o sqlite3

#### Credentials
Para usar os services das apis lembre-se de configurar o arquivo credentials
```
EDITOR=vim rails credentials:edit
```
A chave de segurança deve ser solicitada para [o dono original do repositorio](https://github.com/vitoriacfaria).

#### Setup inicial
Para instalar as dependencias utilize a gem [Bundler](https://rubygems.org/gems/bundler)
```
bundle install
```

Para subir a aplicação
```
rails s
```

### Endpoint Principal
O projeto é composto por dois services, um para a recuperação de dados do [OpenWeatherMap](https://openweathermap.org/) e outro para a publicação no [Twitter](https://twitter.com/), é importante ter todas as chaves configuradas corretamentes, caso contrário a api caira no erro [424 Failed Dependency](https://httpstatuses.com/424).

Para acessar o endpoint basta fazer a requisição abaixo com o método Post.
```
  # /api/v1/forecasts/publish/city_id
  
  http://localhost:3000/api/v1/forecasts/publish/2643743
``` 
Em caso de **sucesso** de publicação o endpoint lhe retornará o [status 200](https://httpstatuses.com/200) e você poderá conferir o novo twitter na conta que foi [configurado no credentials](#credentials).

Em caso de **falha** o erro [424](https://httpstatuses.com/424) irá aparecer.

### Contribuição
Faça um fork do projeto e realize suas alterações. Para padronizar commits use a lib [cz-cli](https://github.com/commitizen/cz-cli).

Esse projeto conta com as seguintes gems e configurações:
 * [Rubocop](https://rubocop.org/): O code style guide da comunidade.
 * [Rspec](https://rspec.info/): aplicação de TDD.

Para contribuir com esse projeto, garanta que suas alterações atendam aos requisitos das gems e libs citadas acima.
Ao passar por todos os checklists abra um pr com a descrição objetiva da alteração. Solicite o review e espere ser aprovado para realizar o merge.