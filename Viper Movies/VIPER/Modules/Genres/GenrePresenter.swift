//
//  Presenter.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 06/06/2022.
//

import Foundation
import UIKit

//Object
// Protocol
//ref to inter, router, view

protocol GenrePresentable{
    var router: GenreRrouter? {get set}
    var interactor: GenreInteractable? {get set}
    var view: GenreView? {get set}
    
    func interactorUpdatesGenres(with genres:[String])
    
}


class GenrePresenter: GenrePresentable{
    
    var view: GenreView?
    var router: GenreRrouter?
    var interactor: GenreInteractable?
    {
        didSet{
            interactor?.getGenres()
        }
    }
    
    func interactorUpdatesGenres(with genres:[String]) {
        view?.update(with: genres)
    }
    
}
