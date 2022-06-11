//
//  MoviePresenter.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 10/06/2022.
//

import Foundation

protocol MoviePresentable {
    var router: MovieRoutingProtocol? {get set}
    var interactor: MovieInteractionProtocol? {get set}
    var view: MovieView? {get set}

    func interactorDidFetchMovies(with result: Result<[Movie],Error>)
}

class MoviePresenter:MoviePresentable{
    var router: MovieRoutingProtocol?
    var interactor: MovieInteractionProtocol?{
        didSet{
            interactor?.getMovies(pageNumber: 1)
        }
    }
    var view: MovieView?

    func interactorDidFetchMovies(with result: Result<[Movie], Error>) {
        switch result{
        case .success(let movies):
            view?.update(with: movies)
        case .failure:
            view?.updated(with: "Something Went Wrong")
        }
    }


}
