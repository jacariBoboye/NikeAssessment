//
//  AlbumCell.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/21/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import Foundation
import UIKit

class AlbumCell: UITableViewCell {
    
    static let cellIdentifier = "albumCell"

    let artistLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thumbNailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func configure(_ album: Album) {
        artistLabel.text = album.artist
        albumLabel.text = album.album
        thumbNailImage.imageFromServerURL(urlString: album.thumbNail, defaultImage: nil)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(albumLabel)
        addSubview(artistLabel)
        addSubview(thumbNailImage)
        
        thumbNailImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thumbNailImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        thumbNailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        thumbNailImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        albumLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo: self.thumbNailImage.trailingAnchor, constant: 8).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8).isActive = true
        
        
        artistLabel.leadingAnchor.constraint(equalTo: self.albumLabel.leadingAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo: self.albumLabel.bottomAnchor, constant: 5).isActive = true
    }
}
