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
    
    var id: Int = 0

    func fetchMarvelCharacters() {
        let request = CharactersList.Request()
        worker?.fetchAllMarvelCharacters(request: request) {
            [weak self] result in
            guard let self = self else {return}
            self.presenter?.handleCharactersList(result: result)
        }
    }
    
    func setSelectedCharacterId(id: Int) {
        self.id = id
    }
}

