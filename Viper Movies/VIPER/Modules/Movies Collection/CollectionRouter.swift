//
//  CollectionRouter.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 10/06/2022.
//

import Foundation

protocol MovieRoutingProtocol:AnyObject{
    func setup()
}

class MovieRouter: MovieRoutingProtocol{

    func setup(){
        let router = MovieRouter()
        var view:MovieView = GenreCell()
        let presenter: MoviePresenter = MoviePresenter()
        var interactor: MovieInteractionProtocol = MovieInteractorClass()

        view.presenter = presenter
        interactor.presenter  = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

    }
}
