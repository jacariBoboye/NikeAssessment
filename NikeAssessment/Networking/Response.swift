//
//  Response.swift
//  NikeAssessment
//
//  Created by Jacari Boboye on 7/22/19.
//  Copyright © 2019 Jacari Boboye. All rights reserved.
//

enum RequestError: Error {
    case invalidReturnedJSON
}

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}
