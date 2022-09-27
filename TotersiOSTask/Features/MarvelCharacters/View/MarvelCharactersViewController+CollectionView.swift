//
//  MarvelCharactersViewController+CollectionView.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

extension MarvelCharactersViewController: UICollectionViewDelegate {
    func setupCollectionView() {
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.prefetchDataSource = self
        charactersCollectionView.registerCell(CharacterCollectionViewCell.self)
        charactersCollectionView.showsVerticalScrollIndicator = false
        charactersCollectionView.backgroundColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.setSelectedCharacterId(id: characters[indexPath.item].id)
        router?.moveToMarvelCharacterDetails()
    }
}

extension MarvelCharactersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CharacterCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        cell.setupCell(thumbnail: characters[indexPath.item].thumbnail)
        return cell
    }
    
}


extension MarvelCharactersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 5) / 2
        let height = (collectionView.frame.size.height - 5) / 2
        return CGSize(width: width, height: height)
    }
}

extension MarvelCharactersViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.item >= characters.count - 3 && !isFetchingData {
                fetchMarvelCharacters()
            }
        }
    }
}

