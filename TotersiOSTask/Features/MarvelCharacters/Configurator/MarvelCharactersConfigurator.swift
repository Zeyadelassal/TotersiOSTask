//
//  MarvelCharactersConfigurator.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

class MarvelCharactersConfigurator {
    
    static func configureScene(viewController: MarvelCharactersViewController) {
        
        let interactor = MarvelCharactersInteractor()
        let worker = MarvelCharactersWorker(networkManager: NetworkManager())
        let presenter = MarvelCharactersPresenter()
        let router = MarvelCharactersRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = viewController
        router.view = viewController
        router.dataStore = interactor
    }
}
