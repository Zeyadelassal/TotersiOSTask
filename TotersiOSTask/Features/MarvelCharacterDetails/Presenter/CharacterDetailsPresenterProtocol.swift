//
//  CharacterDetailsPresenterProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol CharacterDetailsPresenterProtocol: AnyObject {
    func handleCharacterDetails(character: Character?)
    func handleCharacterComics(comics: [CharacterComics.Comic]?)
    func handleCharacterStories(stories: [CharacterStories.Story]?)
    func handleCharacterEvents(events: [CharacterEvents.Event]?)
    func handleCharacterSeries(series: [CharacterSeries.Series]?)
    func showError(error: ResponseError)
}

