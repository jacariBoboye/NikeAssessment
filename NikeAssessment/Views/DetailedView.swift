//
//  DetailedView.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import Foundation
import UIKit

class DetailedView: UIView {
    
    var url = ""
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseDateLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let largeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(openItunes) , for: .touchUpInside)
        return button
    }()
    
    init(album: Album, frame: CGRect) {
        albumLabel.text = "Album: \(album.album)"
        artistLabel.text = "Artist: \(album.artist)"
        releaseDateLable.text = "Relsease Date: \(album.releaseDate)"
        genreLabel.text = "Genre: \(album.genres.first!.name)"
        copyrightLabel.text = "Copyright: \(album.copyright)"
        largeImage.imageFromServerURL(urlString: album.thumbNail, defaultImage: nil)
        url = album.url
        super.init(frame: frame)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        self.addSubview(largeImage)
        self.addSubview(artistLabel)
        self.addSubview(albumLabel)
        self.addSubview(releaseDateLable)
        self.addSubview(genreLabel)
        self.addSubview(copyrightLabel)
        self.addSubview(selectButton)
        
        let stackView = UIStackView(arrangedSubviews: [albumLabel, artistLabel, releaseDateLable, genreLabel, copyrightLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        largeImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        largeImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        largeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        largeImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: largeImage.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8).isActive = true
        
        selectButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        selectButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        selectButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        selectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func openItunes() {
        print("url:", url)
        let itunesURL = URL(string: url)
        if UIApplication.shared.canOpenURL(itunesURL!) { UIApplication.shared.open(itunesURL!)}
        else { UIApplication.shared.open(NSURL(string: url)! as URL) }
    }
}
