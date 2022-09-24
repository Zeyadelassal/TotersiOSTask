//
//  ResponseError.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

enum ResponseError: LocalizedError {
    case decoding
    case network(message: String, code:Int?)
    case unauthenticated
    case offline
    case serverError(message:String, code:Int?)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .decoding:
            return "generic_error"
        case .network(let message,_):
            return message
        case .unauthenticated:
            return "Please log in to continue"
        case .offline:
            return "banner_no_internet_connection"
        case .unknown:
            return "generic_error"
        case .serverError(let message,_):
            return message
        }
    }
}
