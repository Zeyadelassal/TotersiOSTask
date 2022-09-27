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
            
        }
    }
    
    func handleCharacterComics(comics: [CharacterComics.Comic]?) {
        if let comics = comics {
            let comicsViewModel = getCharacterComicsViewModel(comics: comics)
            view?.updateCharacterComics(title: "Comics", comics: comicsViewModel)
        } else {
            
        }
    }
    
    func handleCharacterStories(stories: [CharacterStories.Story]?) {
        if let stories = stories {
            let storiesViewModel = getCharacterStoriesViewModel(stories: stories)
            view?.updateCharacterStories(title: "Stories", stories: storiesViewModel)
        } else {
            
        }
    }
    
    func handleCharacterEvents(events: [CharacterEvents.Event]?) {
        if let events = events {
            let eventsViewModel = getCharacterEventsViewModel(events: events)
            view?.updateCharacterEvents(title: "Events", events: eventsViewModel)
        } else {
            
        }
    }
    
    func handleCharacterSeries(series: [CharacterSeries.Series]?) {
        if let series = series {
            let seriesViewModel = getCharacterSeriesViewModel(series: series)
            view?.updateCharacterSeries(title: "Series", series: seriesViewModel)
            view?.reloadData()
        } else {
            
        }
    }
    
    func showError(error: ResponseError) {
        
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
