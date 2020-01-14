# movie_app
Projeto de estudos para um app sobre filmes, baseado na API ["The Movie DB"](https://www.themoviedb.org/documentation/api)

***

Stack: 
* Swift 5
* xcode 11.3

***

Padrão utilizado: 
* [MVC](https://www.raywenderlich.com/1000705-model-view-controller-mvc-in-ios-a-modern-approach)


***

Features já implementadas

* Layout em abas
* Tela de grid de filmes trazendo a lista de filmes populares
* Scroll infinito da listagem
* Tela de detalhe para filme selecionado

***

Features a implementar

* Botão de favoritos
* Tela de grid com busca local
* Tela de lista de favoritos, persistido entre as sessões do app
* Célula do Grid de filmes com informação se o filme foi favoritado no app ou não

***

Observações:

Para efeitos de estudo com testes unitários, achei que seria importante encapsular as chamadas feitas pelo pod [Alamofire](https://cocoapods.org/pods/Alamofire) em um objeto para o qual pudesse setar comportamento, afim de atingir previsibilidade nos meus testes.

Confesso que isso se apresentou como um desafio grande, e que consegui resolver me baseando na proposta de implementação feita [neste projeto](https://github.com/ksteigerwald/MockAlamofire). 

Vide [RequestManager.swift](https://github.com/marcelaTozzato/movie_app/blob/master/movie_app/movie_app/Networking/RequestManager.swift).

Com alguns ajustes, consegui o resultado esperado, porém os testes ainda estão bastante básicos. Devo me aprofundar nos próximos dias.





