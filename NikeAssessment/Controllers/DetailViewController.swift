//
//  DetailViewController.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    weak var navDelegate: NavigationDelegate?
    var selectedAlbum: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        print("selectedAlbum: ", selectedAlbum)
    }
    
    func createView() {
        guard let album = selectedAlbum else { fatalError("DetailViewController Not Properly configured") }
        self.view.backgroundColor = .white
        let detailedView = DetailedView(album: album, frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(detailedView)
        detailedView.bounds = view.bounds
        
    }
}
