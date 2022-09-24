//
//  Network.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation

struct CONST_API {
    
    struct URL {
        static let BASE_URL           = "http://gateway.marvel.com"
        static let CHARACTERS         = "/v1/public/characters"
        static let CHARACTER_DETAILS  = "/v1/public/characters/$$"
        static let CHARACTER_COMICS   = "/v1/public/characters/$$/comics"
        static let CHARACTER_EVENTS   = "/v1/public/characters/$$/events"
        static let CHARACTER_STORIES  = "/v1/public/characters/$$/series"
        static let CHARACTER_SERIES   = "/v1/public/characters/$$/stories"
    }
    
    struct PARAMETER_KEY {
        static let API_KEY            = "apikey"
        static let HASH               = "hash"
        static let TIME_STAMP         = "ts"
    }
    
    struct PARAMETER_VALUE {
        static let PUBLIC_API_KEY     = "beb3f258b022a06495a74b25aa1dd972"
        static let PRIVATE_API_KEY    = "66ff08bbcdd46a3e6914204a3b0b492bd8ee1c5e"

    }
}


