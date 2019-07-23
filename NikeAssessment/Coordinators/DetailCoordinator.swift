//
//  DetailCoordinator.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import Foundation
import UIKit

class DetailCoordinator: Coordinator {
    
    private let rootFlowController: UINavigationController
    private let album: Album

    init(root: UINavigationController, album: Album) {
        self.rootFlowController = root
        self.album = album
    }

    func start() {
        let detailViewController = DetailViewController()
        detailViewController.selectedAlbum = album
        detailViewController.navDelegate = self
        rootFlowController.pushViewController(detailViewController, animated: true)
    }
}

extension DetailCoordinator: NavigationDelegate {
    
    func didSelect(_ album: Album) {
//        let itunesURL = URL(string: url)
//        if UIApplication.shared.canOpenURL(itunesURL!)
//        {
//            UIApplication.shared.open(itunesURL!)
//
//        } else {
//            //redirect to safari because the user doesn't have Itunes APp
//            UIApplication.shared.open(NSURL(string: url)! as URL)
//        }
    }
}
