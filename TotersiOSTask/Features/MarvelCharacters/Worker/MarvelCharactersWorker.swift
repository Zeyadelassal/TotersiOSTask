//
//  MarvelCharactersWorker.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

class MarvelCharactersWorker {
    func getAllMarvelCharacters(completion: @escaping(Result<CharactersResponseData,ResponseError>) -> Void) {
        CharactersManager.sharedInstance().getAllCharacters(completion: completion)
    }
}
