//
//  CharacterDetailsConfigurator.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

class CharacterDetailsConfigurator {
    
    static func configureScene(viewController: CharacterDetailsViewController) {
        let interactor = CharacterDetailsInteractor()
        let worker = CharacterDetailsWorker(networkManager: NetworkManager())
        let presenter = CharacterDetailsPresenter()
        let router = CharacterDetailsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = viewController
        router.view = viewController
    }
}
