//
//  NSObject+Extension.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

extension NSObject {
    
    static public var className: String {
        return String(describing: self)
    }
    
    static public var nibName : UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
