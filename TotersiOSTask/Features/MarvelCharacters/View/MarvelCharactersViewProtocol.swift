//
//  MarvelCharactersViewProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

protocol MarvelCharactersViewProtocol: AnyObject {
    func updateCharactersList(charactersViewModel: [CharactersList.ViewModel])
    func showError(errorMessage: String)
    func showErrorView(errorMessage: String)
}
