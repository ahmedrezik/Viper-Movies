//
//  CellView.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 07/06/2022.
//

import Foundation
import UIKit

protocol MovieView{
    var presenter: MoviePresenter? {get set}
    func update(with movies:[Movie])
    func updated(with error:String)

}

class GenreCell: UITableViewCell, MovieView{
    var presenter: MoviePresenter?
    var dataSource = MoveListDataSource(movies: [])
    var parentTableView:UITableView?
   
//MARK: - UI Elements
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alwaysBounceVertical = false
        collectionView.bounces = true
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.nameString)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black

        return collectionView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = UIColor(white: 0.4, alpha: 0.7)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


//MARK: - Intializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
       
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


//MARK: - Protocol Methods
    func update(with movies: [Movie]) {
        DispatchQueue.main.async {
            self.dataSource.i = 20
            self.parentTableView?.reloadData()
            self.collectionView.reloadData()

        }
    }

    func updated(with error: String) {
        print(error)
    }

//MARK: - Setup Methods
    func setupView(){
        self.addSubViewList(collectionView,titleLabel)
        setCollectionViewDataSourceDelegate(dataSourceDelegate: dataSource)
        setupViewConstraints()
        sendSubviewToBack(contentView)
    }

    private func setupViewConstraints(){
        NSLayoutConstraint.activate([
            //// Genre Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),

            //// Collection View Constraints
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50)
        ])
    }

    private func configCellLayer() {
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
////Sets Collection View DataSource &  Delegate
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.reloadData()
    }



}
