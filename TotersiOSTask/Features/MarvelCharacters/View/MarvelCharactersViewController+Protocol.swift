//
//  MarvelCharactersViewController+Protocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

extension MarvelCharactersViewController: MarvelCharactersViewProtocol {
    func updateCharactersList(charactersViewModel: [CharactersList.ViewModel]) {
        characters.append(contentsOf: charactersViewModel)
        charactersCollectionView.reloadData()
        isFetchingData = false
        setColorViews(hidden: false)
    }
}
