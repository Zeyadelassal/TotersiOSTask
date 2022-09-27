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
            return CONST_STRING.ERROR.GENERAL
        case .network(let message,_):
            return message
        case .unauthenticated:
            return CONST_STRING.ERROR.AUTHENTICATION
        case .offline:
            return CONST_STRING.ERROR.CONNECTION
        case .unknown:
            return CONST_STRING.ERROR.GENERAL
        case .serverError(let message,_):
            return message
        }
    }
}
