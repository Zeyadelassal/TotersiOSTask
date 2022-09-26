//
//  CharacterDetailsInteractorProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol CharacterDetailsInteractorProtocol: AnyObject {
    var characterDetails: Character? {get set}
    var characterComics: [CharacterComics.Comic]? {get set}
    var characterStories: [CharacterStories.Story]? {get set}
    var characterEvents: [CharacterEvents.Event]? {get set}
    var characterSeries: [CharacterSeries.Series]? {get set}
    func fetchCharacterDetails(for id: Int)
}
