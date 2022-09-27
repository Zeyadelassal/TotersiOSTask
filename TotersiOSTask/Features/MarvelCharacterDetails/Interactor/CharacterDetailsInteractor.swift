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
    let cache = NSCache<NSString, Person>()

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
        if let character = CacheManager.sharedInstance().getCachedCharacterDetails(for: id) {
            characterDetails = character
            self.dispatchGroup.leave()
        } else {
            worker?.fetchCharacterDetails(request: CharacterDetails.Request(id: id)) {
                [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let value):
                    if let data = value.data, let character = data.characters?.first {
                        self.characterDetails = character
                        CacheManager.sharedInstance().cacheCharacterDetails(for: self.id, character: character)
                        self.dispatchGroup.leave()
                    } else {
                        self.handleError(error: value.error)
                    }
                case .failure(let error):
                    self.handleError(error: error)
                }
            }
        }
    }
    
    private func getCharacterComics() {
        dispatchGroup.enter()
        if let comics = CacheManager.sharedInstance().getCachedCharacterComics(for: id) {
            characterComics = comics
            self.dispatchGroup.leave()
        } else {
            worker?.fetchCharacterComics(request: CharacterComics.Request(id: id)) {
                [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let value):
                    if let data = value.data, let comics = data.comics {
                        self.characterComics = comics
                        CacheManager.sharedInstance().cacheCharacterComics(for: self.id, comics: comics)
                        self.dispatchGroup.leave()
                    } else {
                        self.handleError(error: value.error)
                    }
                case .failure(let error):
                    self.handleError(error: error)
                }
            }
        }
    }
    
    private func getCharacterStories() {
        dispatchGroup.enter()
        if let stories = CacheManager.sharedInstance().getCachedCharacterStories(for: id) {
            characterStories = stories
            self.dispatchGroup.leave()
        } else {
            worker?.fetchCharacterStories(request: CharacterStories.Request(id: id)) {
                [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let value):
                    if let data = value.data, let stories = data.stories {
                        self.characterStories = stories
                        CacheManager.sharedInstance().cacheCharacterStories(for: self.id, stories: stories)
                        self.dispatchGroup.leave()
                    } else {
                        self.handleError(error: value.error)
                    }
                case .failure(let error):
                    self.handleError(error: error)
                }
            }
        }
    }
    
    private func getCharacterEvents() {
        dispatchGroup.enter()
        if let events = CacheManager.sharedInstance().getCachedCharacterEvents(for: id) {
            characterEvents = events
            self.dispatchGroup.leave()
        } else {
            worker?.fetchCharacterEvents(request: CharacterEvents.Request(id: id)) {
                [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let value):
                    if let data = value.data, let events = data.events {
                        self.characterEvents = events
                        CacheManager.sharedInstance().cacheCharacterEvents(for: self.id, events: events)
                        self.dispatchGroup.leave()
                    } else {
                        self.handleError(error: value.error)
                    }
                case .failure(let error):
                    self.handleError(error: error)
                }
            }

        }
    }
    
    private func getCharacterSeries() {
        dispatchGroup.enter()
        if let series = CacheManager.sharedInstance().getCachedCharacterSeries(for: id) {
            characterSeries = series
            self.dispatchGroup.leave()
        } else {
            worker?.fetchCharacterSeries(request: CharacterSeries.Request(id: id)) {
                [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let value):
                    if let data = value.data, let series = data.series{
                        self.characterSeries = series
                        CacheManager.sharedInstance().cacheCharacterSeries(for: self.id, series: series)
                        self.dispatchGroup.leave()
                    } else {
                        self.handleError(error: value.error)
                    }
                case .failure(let error):
                    self.handleError(error: error)
                }
            }
        }
    }
        
    private func setupDispatchGroup() {
        let dispatchWorkItem = DispatchWorkItem() {
            [weak self] in
            guard let self = self else {return}
            self.presenter?.handleCharacterDetails(character: self.characterDetails)
            self.presenter?.handleCharacterComics(comics: self.characterComics)
            self.presenter?.handleCharacterEvents(events: self.characterEvents)
            self.presenter?.handleCharacterStories(stories: self.characterStories)
            self.presenter?.handleCharacterSeries(series: self.characterSeries)
        }
        dispatchGroup.notify(queue: .main, work: dispatchWorkItem)
        
    }
    
    private func handleError(error: ResponseError) {
        presenter?.showError(error: error)
    }
}
