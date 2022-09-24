//
//  ViewController.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 24/09/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CharactersManager.sharedInstance().getAllCharacters()
    }


}

