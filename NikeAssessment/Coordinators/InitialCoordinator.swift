//
//  ApplicationCoordinator.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import UIKit

class InitialCoordinator: Coordinator {
    
    let window: UIWindow
    let rootFlowController: UINavigationController
    let mainCoordinator: MainCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootFlowController = UINavigationController()
        mainCoordinator = MainCoordinator(rootFlowController: rootFlowController)
    }
    
    func start() {
        window.rootViewController = rootFlowController
        mainCoordinator.start()
        window.makeKeyAndVisible()
    }
}
