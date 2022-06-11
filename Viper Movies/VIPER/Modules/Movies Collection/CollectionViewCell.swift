//
//  CollectionViewCell.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 08/06/2022.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell{

// MARK: - UI Elements
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

// MARK: - Intializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(imageView)
        imageView.fillSuperview()
    }
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

