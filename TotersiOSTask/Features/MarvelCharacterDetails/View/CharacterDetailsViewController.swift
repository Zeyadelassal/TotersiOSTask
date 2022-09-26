//
//  CharacterDetailsViewController.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController, CharacterDetailsViewProtocol{
    
    @IBOutlet weak var characterImageView: CharacterImageView!
    
    var interactor: CharacterDetailsInteractorProtocol?
    var router: CharacterDetailsRouterProtocol?
    
    var id: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        characterImageView.setImage(thumbnail:  "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16.jpg")
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
