//
//  UICollectionView+Extension.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import UIKit

 extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.nibName, forCellWithReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath:IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.className,for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.className)")
        }
        return cell
    }
    
}
