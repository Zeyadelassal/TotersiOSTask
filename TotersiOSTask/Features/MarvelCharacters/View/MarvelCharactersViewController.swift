//
//  MarvelCharactersViewController.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

class MarvelCharactersViewController: UIViewController {

    @IBOutlet weak var charactersCollectionView: UICollectionView!
    @IBOutlet weak var upperColorView: UIView!
    @IBOutlet weak var lowerColorView: UIView!
    
    var interactor: MarvelCharactersInteractor?
    var router: MarvelCharactersRouterProtocol?
    
    var characters = [CharactersList.ViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MarvelCharactersConfigurator.configureScene(viewController: self)
        setColorViews(hidden: true)
        setupCollectionView()
        fetchMarvelCharacters()
    }
    
    func setColorViews(hidden: Bool) {
        upperColorView.isHidden = hidden
        lowerColorView.isHidden = hidden
    }
    
    func fetchMarvelCharacters() {
        interactor?.fetchMarvelCharacters()
    }
}

extension MarvelCharactersViewController: MarvelCharactersViewProtocol {
    func updateCharactersList(charactersViewModel: [CharactersList.ViewModel]) {
        characters = charactersViewModel
        charactersCollectionView.reloadData()
        setColorViews(hidden: false)
    }
}
