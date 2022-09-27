//
//  CharacterDetailsViewController.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController{
   
    @IBOutlet weak var characterImageView: CharacterImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescLabel: UILabel!
    @IBOutlet weak var characterDetailsTableView: UITableView!
    @IBOutlet weak var characterDetailsHeighConstraint: NSLayoutConstraint!
    
    var interactor: CharacterDetailsInteractorProtocol?
    var router: CharacterDetailsRouterProtocol?
    var id: Int?
    
    var sections: [CharacterDetailsSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterDetailsConfigurator.configureScene(viewController: self)
        setupLabels()
        setupTableView()
        fetchCharacterDetails()
    }
    
    private func setupLabels() {
        characterNameLabel.setupLabelWith(text: "", size: 18, weight: .bold)
        characterDescLabel.setupLabelWith(text: "", size: 14, weight: .semibold)
    }
    
    private func fetchCharacterDetails() {
        showLoader()
        interactor?.fetchCharacterDetails(for: id ?? 0)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize"{
            if object is UITableView{
                if let newvalue = change?[.newKey]{
                    let newsize = newvalue as! CGSize
                    characterDetailsHeighConstraint.constant = newsize.height
                }
            }
        }
    }
    
    @IBAction func back(_ sender: Any) {
        router?.backToCharactersList()
    }
    
    deinit {
        characterDetailsTableView.removeObserver(self, forKeyPath: "contentSize")
    }
}


