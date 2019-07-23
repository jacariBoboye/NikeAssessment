//
//  MainCoordinator.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import UIKit

public class MainCoordinator: Coordinator {
    
    private var mainViewController: MainViewController?
    private var detailViewController: DetailCoordinator?
    private let rootFlowController: UINavigationController
    
    init(rootFlowController: UINavigationController) {
        self.rootFlowController = rootFlowController
    }
    
    func start() {
        let mainViewController = MainViewController()
        mainViewController.navDelegate = self
        rootFlowController.pushViewController(mainViewController, animated: false)
        rootFlowController.navigationBar.topItem?.title = "Top \(topAlbumAmount.topHundred.rawValue) Albums"
        self.mainViewController = mainViewController
    }
}

extension MainCoordinator: NavigationDelegate {
    
    func didSelect(_ album: Album) {
        let detailViewcontroller = DetailCoordinator(root: rootFlowController,
                                                     album: album)
        detailViewcontroller.start()
    }
}
