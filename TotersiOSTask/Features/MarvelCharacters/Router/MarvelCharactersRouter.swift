//
//  MarvelCharactersRouter.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

class MarvelCharactersRouter: MarvelCharactersRouterProtocol, MarvelCharactersDataPassing {
    
    weak var view: UIViewController?
    var dataStore: MarvalCharatersDataStoreProtocol?

    func moveToMarvelCharacterDetails() {
        let viewController = CharacterDetailsViewController()
        viewController.id = dataStore?.id
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

