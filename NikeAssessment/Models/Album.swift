//
//  Album.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/20/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import UIKit

public struct Album: Codable {
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case album = "name"
        case thumbNail = "artworkUrl100"
        case genres
        case releaseDate
        case copyright
        case artistUrl
        case url
    }
    
    let artist: String
    let album: String
    let thumbNail: String
    let genres: [Genres]
    let releaseDate: String
    let copyright: String
    let artistUrl: String
    let url: String
    var thumbNailImage: UIImage?
}

extension Album: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Artist: \(self.artist), Album: \(self.album), thumbnail: \(self.thumbNail))"
    }
}


public struct Genres: Codable {
    let name: String
}

public struct DataContainer<Results: Codable>: Codable {
    let copyright: String
    let country: String
    let icon: String
    let id: String
    let title: String
    let results: Results
}


public struct ItunesResults<Response: Codable>: Codable {
    let feed: DataContainer<Response>?
}

