//
//  NetworkCallEntity.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 06/06/2022.
//

import Foundation

public enum Endpoints {
    //enum Constants
    static let base = "https://api.themoviedb.org/3"
    static let APIkey = "d2ed2dc66b76dd8114925cde235b31e0"
    static let apiKeyParam = "?api_key=\(Endpoints.APIkey)"

    //Cases
    case discover(Int)
    case PosterImage(String)

    //String Value
    var StringValue: String{
        switch self {
        case .discover(let pageNumber): return Endpoints.base + "/discover/movie" + Endpoints.apiKeyParam +  "&page=\(pageNumber)"
        case .PosterImage(let posterpath):
            return "https://image.tmdb.org/t/p/w500/" + posterpath
        }
    }

    //URL intialized using the String
    var url: URL {
        return URL(string: StringValue)!
    }

}
