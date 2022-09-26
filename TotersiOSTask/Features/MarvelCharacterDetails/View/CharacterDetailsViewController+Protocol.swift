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
    }
    
    func updateCharacterComics(comics: [CharacterComics.ViewModel]) {
        
    }
    
    func updateCharacterEvents(events: [CharacterEvents.ViewModel]) {
        
    }
    
    func updateCharacterStories(stories: [CharacterStories.ViewModel]) {
        
    }
    
    func updateCharacterSeries(series: [CharacterSeries.ViewModel]) {
        
    }
}
