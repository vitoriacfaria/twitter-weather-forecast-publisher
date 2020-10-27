# Twitter Weather Forecast Publisher

Esse projeto tem como objetivo publicar no [Twitter](https://twitter.com/) a temperatura do dia atual acompanhado da previsão dos próximos 5 dias, integrando a API do [OpenWeatherMap](https://openweathermap.org/).

## Índices 

* [Inicialização do projeto](#inicialização-do-projeto)
  * [Versões de dependências](#versões-de-dependências)
  * [Setup inicial](#setup-inicial)
  * [Contribuição](#contribuição)

### Inicialização do projeto

#### Versões de dependências
  * Ruby [vs2.7.0](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/) 
  * Ruby on Rails [vs6.0.3](https://rubygems.org/gems/rails)
#### Setup inicial
Para instalar as dependencias utilize a gem [Bundler](https://rubygems.org/gems/bundler)
```
bundle install
```

Para subir a aplicação
```
rails s
```

#### Contribuição
Faça um fork do projeto e realize suas alterações. Para padronizar commits use a lib [cz-cli](https://github.com/commitizen/cz-cli).

Esse projeto conta com as seguintes gems e configurações:
 * [Rubocop](https://rubocop.org/): O code style guide da comunidade.
 * [Rspec](https://rspec.info/): aplicação de TDD.

Para contribuir com esse projeto, garanta que suas alterações atendam aos requisitos das gems e libs citadas acima.
Ao passar por todos os checklists abra um pr com a descrição objetiva da alteração. Solicite o review e espere ser aprovado para realizar o merge.