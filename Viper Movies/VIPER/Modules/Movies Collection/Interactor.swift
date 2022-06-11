//
//  Interactor.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 06/06/2022.
//

import Foundation
import UIKit

//Ref to presenter

protocol MovieInteractionProtocol{
    var presenter: MoviePresentable?{get set}
    func getMovies(pageNumber:Int)
}



class MovieInteractorClass: MovieInteractionProtocol{

    var presenter: MoviePresentable?
////  Fetches Movies from MoviedDB API
    func getMovies(pageNumber:Int) {
        let task = URLSession.shared.dataTask(with: Endpoints.discover(pageNumber).url) {[weak self](data, response, error) in
            guard let data = data else{
                self?.presenter?.interactorDidFetchMovies(with: .failure(FetchErrors.failed))
                print("Failed Fetch") 
                return
            }
            do{
                let entities = try JSONDecoder().decode(MovieResults.self, from: data)
                self?.presenter?.interactorDidFetchMovies(with: .success(entities.results))
                print("Success")
            }

            catch{
                print("Failed Decode")
                self?.presenter?.interactorDidFetchMovies(with: .failure(FetchErrors.failed))
            }
        }
        task.resume()
    }

}



