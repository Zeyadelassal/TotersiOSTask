//
//  MarvelCharactersViewController+Protocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

extension MarvelCharactersViewController: MarvelCharactersViewProtocol {
    func updateCharactersList(charactersViewModel: [CharactersList.ViewModel]) {
        characters = charactersViewModel
        charactersCollectionView.reloadData()
        setColorViews(hidden: false)
    }
}
