//
//  MoviesDataSource.swift
//  Viper Movies
//
//  Created by Ahmed Rezik on 06/06/2022.
//

import Foundation
import UIKit

class ResultListDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var presenter: MoviePresenter?


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreCell.nameString, for: indexPath) as! GenreCell
        cell.parentTableView = tableView
        cell.selectionStyle = .none
        cell.titleLabel.text = genres[indexPath.row]
        cell.backgroundColor = .orange
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? GenreCell else { return }
        tableViewCell.collectionView.reloadData()

    }



}

