//
//  CharacterDetailsViewProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol CharacterDetailsViewProtocol: AnyObject {
    func updateCharacterDetails(characterDetails: CharacterDetails.ViewModel)
    func updateCharacterComics(title: String, comics: [CharacterComics.ViewModel])
    func updateCharacterEvents(title: String, events: [CharacterEvents.ViewModel])
    func updateCharacterStories(title: String, stories: [CharacterStories.ViewModel])
    func updateCharacterSeries(title: String, series: [CharacterSeries.ViewModel])
    func reloadData()
    func showError(errorMessage: String)
    func showErrorView(errorMessage: String)
}
