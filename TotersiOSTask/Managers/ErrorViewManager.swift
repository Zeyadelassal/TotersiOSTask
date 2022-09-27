//
//  ErrorViewManager.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 27/09/2022.
//

import UIKit

class ErrorViewManager {
    class func sharedInstance() -> ErrorViewManager {
        struct Singleton{
            static var shared = ErrorViewManager()
        }
        return Singleton.shared
    }
    
    var errorView: UIView? = nil
    
    func setErrorView (_ view: UIView?) {
        errorView = view
    }
    
    func gerErrorView() -> UIView? {
        return errorView
    }
}
