//
//  LottieAnimationManager.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 27/09/2022.
//

import Lottie

class LottieAnimationManager {
    
    class func sharedInstance() -> LottieAnimationManager {
        struct Singleton{
            static var shared = LottieAnimationManager()
        }
        return Singleton.shared
    }
    
    let lottieLoader = AnimationView(name: CONST_STRING.LOTTIE.LOADER)
    
    func getLottieLoader() -> AnimationView {
        return lottieLoader
    }
}
