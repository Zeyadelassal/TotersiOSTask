//
//  CacheManager.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 27/09/2022.
//

import Foundation

class Person {
    var age = 12
    var name = "Zeyad"
}

class CacheManager {
    
    private init(){}
    
    class func sharedInstance() -> CacheManager {
        struct Singleton{
            static var shared = CacheManager()
        }
        return Singleton.shared
    }
    
    private let detailsCache = Cache<String, Character>()
    private let comicsCache = Cache<String, [CharacterComics.Comic]>()
    private let eventsCache = Cache<String, [CharacterEvents.Event]>()
    private let storiesCache = Cache<String, [CharacterStories.Story]>()
    private let seriesCache = Cache<String, [CharacterSeries.Series]>()

    func cacheCharacterDetails(for id: Int, character: Character) {
        detailsCache.insert(character, forKey: "details\(id)")
    }
    
    func getCachedCharacterDetails(for id: Int) -> Character? {
        return detailsCache.value(forKey: "details\(id)")
    }
    
    func cacheCharacterComics(for id: Int, comics: [CharacterComics.Comic]) {
        comicsCache.insert(comics, forKey: "comics\(id)")
    }
    
    func getCachedCharacterComics(for id: Int) -> [CharacterComics.Comic]? {
        return comicsCache.value(forKey: "comics\(id)")
    }
    
    func cacheCharacterEvents(for id: Int, events: [CharacterEvents.Event]) {
        eventsCache.insert(events, forKey: "events\(id)")
    }
    
    func getCachedCharacterEvents(for id: Int) -> [CharacterEvents.Event]? {
        return eventsCache.value(forKey: "events\(id)")
    }

    func cacheCharacterStories(for id: Int, stories: [CharacterStories.Story]) {
        storiesCache.insert(stories, forKey: "stories\(id)")
    }
    
    func getCachedCharacterStories(for id: Int) -> [CharacterStories.Story]? {
        return storiesCache.value(forKey: "stories\(id)")
    }

    func cacheCharacterSeries(for id: Int, series: [CharacterSeries.Series]) {
        seriesCache.insert(series, forKey: "series\(id)")
    }
    
    func getCachedCharacterSeries(for id: Int) -> [CharacterSeries.Series]? {
        return seriesCache.value(forKey: "series\(id)")
    }

}
