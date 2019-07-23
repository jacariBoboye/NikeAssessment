//
//  ItunesRequest.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/22/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

import Foundation
import UIKit

struct AlbumRequest {
    
    let resultLimit: Int
    
    init(resultLimit: Int) {
        self.resultLimit = resultLimit
    }

    var url: URL {
        return baseURL.appendingPathComponent(path)
    }
    
    var baseURL: URL {
        return URL(string: "https://rss.itunes.apple.com")!
    }
    
    var path: String {
        return "/api/v1/us/apple-music/top-albums/all/\(resultLimit)/explicit.json"
    }

    func start(usingCompletionHandler completionHandler: @escaping (Result<[Album], RequestError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let itunesResponse = try JSONDecoder().decode(ItunesResults<[Album]>.self, from: data)
                    if let dataContainer = itunesResponse.feed {
                        let albums = dataContainer.results
                        DispatchQueue.main.async { completionHandler(.success(albums)) }
                    }
                } catch let error {
                    print("error:", error)
                    DispatchQueue.main.async { completionHandler(.failure(.invalidReturnedJSON)) }
                }
            }
        }.resume()
    }
}
