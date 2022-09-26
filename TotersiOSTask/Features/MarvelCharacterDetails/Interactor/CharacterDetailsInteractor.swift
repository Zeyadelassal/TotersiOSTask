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
    private let dispatchGroup = DispatchGroup()
    var characterDetails: Character?
    var characterComics: [CharacterComics.Comic]?
    var characterStories: [CharacterStories.Story]?
    var characterEvents: [CharacterEvents.Event]?
    var characterSeries: [CharacterSeries.Series]?
    private var id: Int = 0
    
    func fetchCharacterDetails(for id: Int) {
        self.id = id
        getCharacterDetails()
        getCharacterComics()
        getCharacterEvents()
        getCharacterStories()
        getCharacterSeries()
        setupDispatchGroup()
    }
    
    private func getCharacterDetails() {
        dispatchGroup.enter()
        worker?.fetchCharacterDetails(request: CharacterDetails.Request(id: id)) {
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
        worker?.fetchCharacterComics(request: CharacterComics.Request(id: id)) {
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
        worker?.fetchCharacterStories(request: CharacterStories.Request(id: id)) {
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
        worker?.fetchCharacterEvents(request: CharacterEvents.Request(id: id)) {
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
        worker?.fetchCharacterSeries(request: CharacterSeries.Request(id: id)) {
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
            self.presenter?.handleCharacterDetails(character: self.characterDetails)
            self.presenter?.handleCharacterComics(comics: self.characterComics)
            self.presenter?.handleCharacterStories(stories: self.characterStories)
            self.presenter?.handleCharacterEvents(events: self.characterEvents)
            self.presenter?.handleCharacterSeries(series: self.characterSeries)
        }
        dispatchGroup.notify(queue: .main, work: dispatchWorkItem)
    }
    
    private func handleError(error: ResponseError) {
        presenter?.showError(error: error)
    }
}
