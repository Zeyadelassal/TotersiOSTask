//
//  MarvelCharactersInteractorProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol MarvelCharactersInteractorProtocol: AnyObject {
    func fetchMarvelCharacters()
    func setSelectedCharacterId(id: Int)
}

protocol MarvalCharatersDataStoreProtocol: AnyObject {
    var id: Int {get set}
}
