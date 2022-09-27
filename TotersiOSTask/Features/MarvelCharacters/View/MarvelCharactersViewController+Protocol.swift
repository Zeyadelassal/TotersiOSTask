//
//  MarvelCharactersViewController+Protocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

extension MarvelCharactersViewController: MarvelCharactersViewProtocol {
    func updateCharactersList(charactersViewModel: [CharactersList.ViewModel]) {
        stopLoader()
        removeErrorView()
        characters.append(contentsOf: charactersViewModel)
        charactersCollectionView.reloadData()
        charactersCollectionView.endRefresh()
        isFetchingData = false
        setColorViews(hidden: false)
    }
    
    func showError(errorMessage: String) {
        stopLoader()
        removeErrorView()
        showAlert(
            title: CONST_STRING.ALERT.ERROR,
            message: errorMessage,
            actionTitle: CONST_STRING.ALERT.RETRY){
                [weak self] in
                guard let self = self else {return}
                self.handleRetryCounts()
            }
    }
    
    func showErrorView(errorMessage: String) {
        stopLoader()
        showErrorView(target: self, retryAction: #selector(retry), errorMessage: errorMessage)
    }
    
    @objc func retry() {
        handleRetryCounts()
    }
    
    private func handleRetryCounts() {
        if retryCounts < 3 {
            fetchMarvelCharacters(isLoading: true, isRefreshing: false)
        }
        retryCounts += 1
    }
}
