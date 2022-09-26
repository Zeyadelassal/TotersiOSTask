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

    override func viewDidLoad() {
        super.viewDidLoad()
        CharacterDetailsConfigurator.configureScene(viewController: self)
        interactor?.fetchCharacterDetails(for: id ?? 0)
    }
}


