//
//  UIViewController+Extension.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 27/09/2022.
//

import UIKit
import Lottie

extension UIViewController{
    
    func showLoader() {
        let lottieLoader = LottieAnimationManager.sharedInstance().getLottieLoader()
        view.addSubview(lottieLoader)
        lottieLoader.translatesAutoresizingMaskIntoConstraints = false
        lottieLoader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottieLoader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lottieLoader.widthAnchor.constraint(equalToConstant: 150).isActive = true
        lottieLoader.heightAnchor.constraint(equalToConstant: 150).isActive = true
        lottieLoader.loopMode = .loop
        lottieLoader.play()
    }
    
    func stopLoader(){
        let lottieLoader = LottieAnimationManager.sharedInstance().getLottieLoader()
        lottieLoader.removeFromSuperview()
    }
    
    func showAlert(title:String,message:String,actionTitle:String,completion:@escaping()->Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: actionTitle, style: UIAlertAction.Style.cancel){(action) in
            completion()
            alert.dismiss(animated: true, completion: nil)}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

