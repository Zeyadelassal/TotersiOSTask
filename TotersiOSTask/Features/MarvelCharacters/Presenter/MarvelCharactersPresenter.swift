//
//  MarvelCharactersPresenter.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

class MarvelCharactersPresenter: MarvelCharactersPresenterProtocol {
    
    weak var view: MarvelCharactersViewProtocol?
    
    func handleCharactersList(characters: [Character]) {
        if !characters.isEmpty {
            let charactersViewModel = getCharactersViewModel(characters: characters)
            view?.updateCharactersList(charactersViewModel: charactersViewModel)
        } else {
            view?.showErrorView(errorMessage: CONST_STRING.ERROR.EMPTY_DATA)
        }
    }
    
    func showError(error: ResponseError) {
        switch error {
        case .offline:
            view?.showErrorView(errorMessage: error.errorDescription ?? error.localizedDescription)
        case .decoding, .unauthenticated, .unknown :
            view?.showError(errorMessage: error.errorDescription ?? error.localizedDescription )
        case .network(let message,_), .serverError(message: let message,_):
            view?.showError(errorMessage: message)
        }
    }
        
    private func getCharactersViewModel(characters: [Character]) -> [CharactersList.ViewModel] {
        var charactersViewModel = [CharactersList.ViewModel]()
        for character in characters {
            let characterViewModel = CharactersList.ViewModel(character: character)
            charactersViewModel.append(characterViewModel)
        }
        return charactersViewModel
    }

}
