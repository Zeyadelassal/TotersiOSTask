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
    
    func showErrorView(target: Any, retryAction: Selector, errorMessage: String) {
        guard ErrorViewManager.sharedInstance().gerErrorView() == nil else {return}
        let errorView = UIView(frame: .zero)
        let errorImage = UIImageView(frame: .zero)
        let errorLabel = UILabel(frame: .zero)
        let retryButton = UIButton(frame: .zero)
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorView)
        errorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        errorView.backgroundColor = .white
        
        let centerContainerView = UIView(frame: .zero)
        centerContainerView.translatesAutoresizingMaskIntoConstraints = false
        errorView.addSubview(centerContainerView)
        centerContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        centerContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        errorImage.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.addSubview(errorImage)
        errorImage.topAnchor.constraint(equalTo: centerContainerView.topAnchor, constant: 0).isActive = true
        errorImage.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor, constant: 0).isActive = true
        errorImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        errorImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        errorImage.image = #imageLiteral(resourceName: "empty-view")

        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.addSubview(errorLabel)
        errorLabel.topAnchor.constraint(equalTo: errorImage.bottomAnchor, constant: 16).isActive = true
        errorLabel.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor, constant: 0).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: centerContainerView.leadingAnchor, constant: 10).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: centerContainerView.trailingAnchor, constant: 10).isActive = true
        errorLabel.setupLabelWith(text: errorMessage, size: 18, weight: .bold)

        retryButton.translatesAutoresizingMaskIntoConstraints = false
        centerContainerView.addSubview(retryButton)
        retryButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 16).isActive = true
        retryButton.bottomAnchor.constraint(equalTo: centerContainerView.bottomAnchor, constant: 0).isActive = true
        retryButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        retryButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        retryButton.centerXAnchor.constraint(equalTo: centerContainerView.centerXAnchor, constant: 0).isActive = true
        retryButton.backgroundColor = .red
        retryButton.setTitle(CONST_STRING.ALERT.RETRY, for: .normal)
        retryButton.titleLabel?.setupLabelWith(text: CONST_STRING.ALERT.RETRY, size: 18, weight: .semibold)
        retryButton.layer.cornerRadius = 10
        retryButton.addTarget(target, action: retryAction, for: .touchUpInside)
        
        ErrorViewManager.sharedInstance().setErrorView(errorView)
    }
    
    func removeErrorView() {
        let errorView = ErrorViewManager.sharedInstance().gerErrorView()
        errorView?.removeFromSuperview()
        ErrorViewManager.sharedInstance().setErrorView(nil)
    }
}

