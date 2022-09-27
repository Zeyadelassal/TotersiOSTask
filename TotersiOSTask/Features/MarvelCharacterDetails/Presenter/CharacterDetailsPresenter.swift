//
//  CharacterDetailsPresenter.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    
    weak var view: CharacterDetailsViewProtocol?
    
    func handleCharacterDetails(character: Character?) {
        if let character = character {
            let characterDetailsViewModel = getCharacterDetailsViewModel(character: character)
            view?.updateCharacterDetails(characterDetails: characterDetailsViewModel)
        } else {
            view?.showErrorView(errorMessage: ResponseError.unknown.errorDescription ?? CONST_STRING.ERROR.GENERAL)
        }
    }
    
    func handleCharacterComics(comics: [CharacterComics.Comic]?) {
        var comicsViewModel = [CharacterComics.ViewModel] ()
        if let comics = comics {
            comicsViewModel = getCharacterComicsViewModel(comics: comics)
        }
        view?.updateCharacterComics(title: CONST_STRING.HEADER_TITLE.COMICS + " (\(comicsViewModel.count))", comics: comicsViewModel)
    }
    
    func handleCharacterEvents(events: [CharacterEvents.Event]?) {
        var eventsViewModel = [CharacterEvents.ViewModel]()
        if let events = events {
            eventsViewModel = getCharacterEventsViewModel(events: events)
        }
        view?.updateCharacterEvents(title: CONST_STRING.HEADER_TITLE.EVENTS + " (\(eventsViewModel.count))", events: eventsViewModel)
    }
    
    func handleCharacterStories(stories: [CharacterStories.Story]?) {
        var storiesViewModel = [CharacterStories.ViewModel]()
        if let stories = stories {
            storiesViewModel = getCharacterStoriesViewModel(stories: stories)
        }
        view?.updateCharacterStories(title: CONST_STRING.HEADER_TITLE.STORIES + " (\(storiesViewModel.count))", stories: storiesViewModel)
    }
    
    func handleCharacterSeries(series: [CharacterSeries.Series]?) {
        var seriesViewModel = [CharacterSeries.ViewModel]()
        if let series = series {
            seriesViewModel = getCharacterSeriesViewModel(series: series)
        }
        view?.updateCharacterSeries(title: CONST_STRING.HEADER_TITLE.SERIES + " (\(seriesViewModel.count))", series: seriesViewModel)
        view?.reloadData()
    }
    
    func showError(error: ResponseError) {
        switch error {
        case .offline, .decoding, .unauthenticated, .unknown :
            view?.showErrorView(errorMessage: error.errorDescription ?? error.localizedDescription)
        case .network(let message,_), .serverError(message: let message,_):
            view?.showErrorView(errorMessage: message)
        }
    }
    
    private func getCharacterDetailsViewModel(character: Character) -> CharacterDetails.ViewModel {
        return CharacterDetails.ViewModel(character: character)
    }
    
    private func getCharacterComicsViewModel(comics: [CharacterComics.Comic]) -> [CharacterComics.ViewModel] {
        var comicsViewModel = [CharacterComics.ViewModel]()
        guard !comics.isEmpty else {return comicsViewModel}
        let endRange = comics.count <= 3 ? comics.count : 3
        for i in 0...endRange - 1{
            comicsViewModel.append(CharacterComics.ViewModel(comic: comics[i]))
        }
        return comicsViewModel
    }
    
    private func getCharacterEventsViewModel(events: [CharacterEvents.Event]) -> [CharacterEvents.ViewModel] {
        var eventsViewModel = [CharacterEvents.ViewModel]()
        guard !events.isEmpty else {return eventsViewModel}
        let endRange = events.count <= 3 ? events.count : 3
        for i in 0...endRange - 1{
            eventsViewModel.append(CharacterEvents.ViewModel(event: events[i]))
        }
        return eventsViewModel
    }
    
    private func getCharacterStoriesViewModel(stories: [CharacterStories.Story]) -> [CharacterStories.ViewModel] {
        var storiesViewModel = [CharacterStories.ViewModel]()
        guard !stories.isEmpty else {return storiesViewModel}
        let endRange = stories.count <= 3 ? stories.count : 3
        for i in 0...endRange - 1{
            storiesViewModel.append(CharacterStories.ViewModel(story: stories[i]))
        }
        return storiesViewModel
    }
    
    private func getCharacterSeriesViewModel(series: [CharacterSeries.Series]) -> [CharacterSeries.ViewModel] {
        var seriesViewModel = [CharacterSeries.ViewModel]()
        guard !series.isEmpty else {return seriesViewModel}
        let endRange = series.count <= 3 ? series.count : 3
        for i in 0...endRange - 1{
            seriesViewModel.append(CharacterSeries.ViewModel(series: series[i]))
        }
        return seriesViewModel
    }
    
}
