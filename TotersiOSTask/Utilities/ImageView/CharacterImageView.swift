//
//  CharacterImageView.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit
import Kingfisher

class CharacterImageView: UIImageView {
    func setImage(thumbnail:String){
        let placeHolder = #imageLiteral(resourceName: "marvel-placeholder")
        if let imageURL = URL(string: thumbnail) {
            let resource = ImageResource(downloadURL: imageURL)
            kf.indicatorType = .activity
            kf.setImage(with: resource, placeholder: placeHolder)
        }else{
            image = placeHolder
        }
    }

}
