//
//  UILabel.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

extension UILabel{
    
    func setupLabelWith(text : String,size:CGFloat, weight:UIFont.Weight){
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.text = text
    }

}
