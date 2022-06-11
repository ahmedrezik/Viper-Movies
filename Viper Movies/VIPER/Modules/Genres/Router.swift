//
//  Router.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 06/06/2022.
//

import Foundation
import UIKit
// Entry Point


typealias EntryPoint = GenreView & UIViewController

protocol GenreRrouter{
    var  entryView: EntryPoint? {get}
    static func start() -> GenreRrouter
    func fetchCV()
}

class GenreViewRouter: GenreRrouter{
    //MARK:-
    var entryView: EntryPoint?

    static func start() -> GenreRrouter {
        let router = GenreViewRouter()
        var view: GenreView = MovieViewController()
        var presenter: GenrePresentable = GenrePresenter()
        var interactor: GenreInteractable = GenreInteractor()

        view.presenter = presenter
        interactor.presenter  = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entryView = view as? EntryPoint
        
        return router
    }
    func fetchCV(){
        MovieRouter().setup()
    }


}
