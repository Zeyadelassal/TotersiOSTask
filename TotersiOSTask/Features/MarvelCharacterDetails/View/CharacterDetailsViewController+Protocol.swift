//
//  CharacterDetailsViewController+Protocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

extension CharacterDetailsViewController: CharacterDetailsViewProtocol {
    func updateCharacterDetails(characterDetails: CharacterDetails.ViewModel) {
        characterImageView.setImage(thumbnail: characterDetails.thumbnail)
        characterNameLabel.text = "\(characterDetails.name)  #\(characterDetails.id)"
        characterDescLabel.text = characterDetails.desc
    }
    
    func updateCharacterComics(title: String, comics: [CharacterComics.ViewModel]) {
        let comicsSection = CharacterDetailsSection(title: title, items: comics, isOpened: false)
        sections.append(comicsSection)
    }
    
    func updateCharacterEvents(title: String, events: [CharacterEvents.ViewModel]) {
        let eventsSection = CharacterDetailsSection(title: title, items: events, isOpened: false)
        sections.append(eventsSection)
    }
    
    func updateCharacterStories(title: String, stories: [CharacterStories.ViewModel]) {
        let storiesSection = CharacterDetailsSection(title: title, items: stories, isOpened: false)
        sections.append(storiesSection)
    }
    
    func updateCharacterSeries(title: String, series: [CharacterSeries.ViewModel]) {
        let seriesSection = CharacterDetailsSection(title: title, items: series, isOpened: false)
        sections.append(seriesSection)
    }
    
    func reloadData() {
        stopLoader()
        characterDetailsTableView.reloadData()
    }
}
