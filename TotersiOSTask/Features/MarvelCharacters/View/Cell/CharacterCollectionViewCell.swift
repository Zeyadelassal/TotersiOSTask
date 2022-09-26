//
//  CharacterCollectionViewCell.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImage: CharacterImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(thumbnail: String) {
        characterImage.contentMode = .scaleAspectFill
        characterImage.setImage(thumbnail: thumbnail)
    }

}
