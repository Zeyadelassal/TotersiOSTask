//
//  CharacterDetailsViewProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol CharacterDetailsViewProtocol: AnyObject {
    func updateCharacterDetails(characterDetails: CharacterDetails.ViewModel)
    func updateCharacterComics(comics: [CharacterComics.ViewModel])
    func updateCharacterEvents(events: [CharacterEvents.ViewModel])
    func updateCharacterStories(stories: [CharacterStories.ViewModel])
    func updateCharacterSeries(series: [CharacterSeries.ViewModel])
}
