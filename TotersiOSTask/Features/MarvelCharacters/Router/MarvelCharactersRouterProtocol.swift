//
//  MarvelCharactersRouterProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol MarvelCharactersRouterProtocol: AnyObject {
    func moveToMarvelCharacterDetails()
}

protocol MarvelCharactersDataPassing {
    var dataStore: MarvalCharatersDataStoreProtocol? { get set}
}
