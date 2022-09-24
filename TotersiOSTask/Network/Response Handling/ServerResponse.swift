//
//  ServerResponse.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum ServerResponse<T> {
    case success(T), failure(ResponseError)
}
