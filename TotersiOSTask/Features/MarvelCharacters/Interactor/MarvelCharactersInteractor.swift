//
//  MarvelCharactersInteractor.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation


class MarvelCharactersInteractor: MarvelCharactersInteractorProtocol, MarvalCharatersDataStoreProtocol {
    
    var worker: MarvelCharactersWorkerProtocol?
    var presenter: MarvelCharactersPresenterProtocol?
    var offset = 0
    var id: Int = 0

    func fetchMarvelCharacters() {
        let request = CharactersList.Request(offset: offset)
        worker?.fetchAllMarvelCharacters(request: request) {
            [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                if let charactersData = value.data, let characters = charactersData.characters {
                    self.offset += 20
                    self.presenter?.handleCharactersList(characters: characters)
                } else {
                    debugPrint("Error",value.error)
                }
            case .failure(let error):
                debugPrint("Error",error)
            }
        }
    }
    
    func setSelectedCharacterId(id: Int) {
        self.id = id
    }
}

