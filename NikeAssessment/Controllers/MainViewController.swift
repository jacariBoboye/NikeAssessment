//
//  ViewController.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import UIKit

enum topAlbumAmount: Int {
    case topHundred = 100
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    var albumViewModel: AlbumViewModel?
    var request = AlbumRequest(resultLimit: topAlbumAmount.topHundred.rawValue)
    weak var navDelegate: NavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        getAlbums()
    }
    
    func configureView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.cellIdentifier)
    }
    
    func getAlbums() {
        request.start {
            switch $0 {
            case .success(let albums):
                self.albumViewModel = AlbumViewModel(albums: albums)
                self.tableView.reloadData()
            case .failure(let error):
                print("error:", error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = albumViewModel else { return 0 }
        print("count: ", viewModel.albums.count)
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = albumViewModel, let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.cellIdentifier, for: indexPath) as? AlbumCell
            else { return UITableViewCell() }
        cell.configure(viewModel.albums[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = albumViewModel else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        self.navDelegate?.didSelect(viewModel.albums[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}



