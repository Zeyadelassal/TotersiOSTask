//
//  CharactersManager.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import Foundation


class CharactersManager {
    
    private init(){}
    
    class func sharedInstance() -> CharactersManager {
        struct Singleton{
            static var shared = CharactersManager()
        }
        return Singleton.shared
    }
    
    
    func getAllCharacters() {
        
    }
}
