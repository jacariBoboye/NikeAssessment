//
//  UIImageView.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/23/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func imageFromServerURL(urlString: String, defaultImage : String?) {
        if let defaultImage = defaultImage {
            self.image = UIImage(named: defaultImage)
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    self.image = image
                })
            }
        }).resume()
    }
}
