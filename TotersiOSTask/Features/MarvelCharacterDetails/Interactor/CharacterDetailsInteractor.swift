//
//  CharacterDetailsInteractor.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

class CharacterDetailsInteractor: CharacterDetailsInteractorProtocol {

    var worker: CharacterDetailsWorkerProtocol?
    var presenter: CharacterDetailsPresenterProtocol?
    let dispatchGroup = DispatchGroup()
    var characterDetails: Character?
    var characterComics: [CharacterComics.Comic]?
    var characterStories: [CharacterStories.Story]?
    var characterEvents: [CharacterEvents.Event]?
    var characterSeries: [CharacterSeries.Series]?

    func fetchCharacterDetails() {
        setupDispatchGroup()
        getCharacterDetails()
        getCharacterComics()
        getCharacterEvents()
        getCharacterStories()
        getCharacterSeries()
    }
    
    private func getCharacterDetails() {
        dispatchGroup.enter()
        worker?.fetchCharacterDetails(request: CharacterDetails.Request()) {
            [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                if let data = value.data, let character = data.characters?.first {
                    self.dispatchGroup.leave()
                    self.characterDetails = character
                } else {
                    self.handleError(error: value.error)
                }
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func getCharacterComics() {
        dispatchGroup.enter()
        worker?.fetchCharacterComics(request: CharacterComics.Request()) {
            [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                if let data = value.data, let comics = data.comics {
                    self.dispatchGroup.leave()
                    self.characterComics = comics
                } else {
                    self.handleError(error: value.error)
                }
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func getCharacterStories() {
        dispatchGroup.enter()
        worker?.fetchCharacterStories(request: CharacterStories.Request()) {
            [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                if let data = value.data, let stories = data.stories {
                    self.dispatchGroup.leave()
                    self.characterStories = stories
                } else {
                    self.handleError(error: value.error)
                }
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func getCharacterEvents() {
        dispatchGroup.enter()
        worker?.fetchCharacterEvents(request: CharacterEvents.Request()) {
            [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                if let data = value.data, let events = data.events {
                    self.dispatchGroup.leave()
                    self.characterEvents = events
                } else {
                    self.handleError(error: value.error)
                }
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func getCharacterSeries() {
        dispatchGroup.enter()
        worker?.fetchCharacterSeries(request: CharacterSeries.Request()) {
            [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                if let data = value.data, let series = data.series{
                    self.dispatchGroup.leave()
                    self.characterSeries = series
                } else {
                    self.handleError(error: value.error)
                }
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func setupDispatchGroup() {
        let dispatchWorkItem = DispatchWorkItem() {
            [weak self] in
            guard let self = self else {return}
            guard let characterDetails = self.characterDetails else {return}
            guard let characterComics = self.characterComics else {return}
            guard let characterStories = self.characterStories else {return}
            guard let characterEvents = self.characterEvents else {return}
            guard let characterSeries = self.characterSeries else {return}
            self.presenter?.handleCharacterDetails(character: characterDetails)
            self.presenter?.handleCharacterComics(comics: characterComics)
            self.presenter?.handleCharacterStories(stories: characterStories)
            self.presenter?.handleCharacterEvents(events: characterEvents)
            self.presenter?.handleCharacterSeries(series: characterSeries)
        }
        dispatchGroup.notify(queue: .main, work: dispatchWorkItem)
    }
    
    private func handleError(error: ResponseError) {
        presenter?.showError(error: error)
    }
}
