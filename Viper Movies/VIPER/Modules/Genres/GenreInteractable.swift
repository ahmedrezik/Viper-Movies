//
//  GenreInteractor.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 10/06/2022.
//

import Foundation

protocol GenreInteractable{
    var presenter: GenrePresentable?{get set}
    func getGenres()
}

class GenreInteractor: GenreInteractable{
    var presenter: GenrePresentable?

    func getGenres() {
        presenter?.interactorUpdatesGenres(with: genres)
    }
}
