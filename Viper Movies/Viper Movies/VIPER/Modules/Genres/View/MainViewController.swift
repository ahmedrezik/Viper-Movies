//
//  View.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 06/06/2022.
//

import Foundation
import UIKit
// ViewContr


protocol GenreView{
    var presenter: GenrePresentable? {get set}

    func update(with genres:[String])
    func updated(with error:String)

}

class MovieViewController: UIViewController, GenreView{

    var presenter: GenrePresentable?
    var dataSource = ResultListDataSource()
// MARK: - UI Elements
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(GenreCell.self, forCellReuseIdentifier: GenreCell.nameString)
        table.isHidden = true
        table.estimatedRowHeight = 200
        table.rowHeight = 200
        return table
    }()
// MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .blue
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }

//MARK: - Protocol Methods
    func update(with genres: [String]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.presenter?.router?.fetchCV()
        }
    }

    func updated(with error: String) {
        print(error)
    }

}
