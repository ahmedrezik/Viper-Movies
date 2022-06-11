//
//  CollectionViewDataSource.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 08/06/2022.
//

import Foundation
import UIKit

class MoveListDataSource:NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var movies:[Movie]?
    var i = 20
    //MARK:- Init
    init(movies: [Movie]) {
        self.movies = movies
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return i
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.nameString, for: indexPath) as! MovieCell
        //TODO: - load Image
        return cell
    }

    
    

   




}

