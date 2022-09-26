//
//  MarvelCharactersPresenter.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

class MarvelCharactersPresenter: MarvelCharactersPresenterProtocol {
    
    weak var view: MarvelCharactersViewProtocol?
    
    func handleCharactersList(result: Result<CharactersList.Response, ResponseError>) {
        switch result {
        case .success(let value):
            if let charactersData = value.data, let characters = charactersData.characters {
                let charactersViewModel = getCharactersViewModel(characters: characters)
                view?.updateCharactersList(charactersViewModel: charactersViewModel)
            } else {
                // Error
            }
        case .failure(let error):
            debugPrint("Error",error)
        }
    }
    
    private func getCharactersViewModel(characters: [CharactersList.Character]) -> [CharactersList.ViewModel] {
        var charactersViewModel = [CharactersList.ViewModel]()
        for character in characters {
            let characterViewModel = CharactersList.ViewModel(character: character)
            charactersViewModel.append(characterViewModel)
        }
        return charactersViewModel
    }

}
