//
//  MarvelCharactersPresenterProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol MarvelCharactersPresenterProtocol: AnyObject {
    func handleCharactersList(result: Result<CharactersList.Response, ResponseError>)
}


