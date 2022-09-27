//
//  ViewModelProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol ViewModelProtocol {
    var title: String {get set}
    var desc: String {get set}
    var thumbnail: String {get set}
    var extra: String {get set}
}
