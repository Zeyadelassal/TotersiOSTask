//
//  CacheManager.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 27/09/2022.
//

import Foundation

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
        detailsCache.insert(character, forKey: CONST_STRING.CACHE.DETAILS + "\(id)")
    }
    
    func getCachedCharacterDetails(for id: Int) -> Character? {
        return detailsCache.value(forKey: CONST_STRING.CACHE.DETAILS + "\(id)")
    }
    
    func cacheCharacterComics(for id: Int, comics: [CharacterComics.Comic]) {
        comicsCache.insert(comics, forKey: CONST_STRING.CACHE.COMICS + "\(id)")
    }
    
    func getCachedCharacterComics(for id: Int) -> [CharacterComics.Comic]? {
        return comicsCache.value(forKey: CONST_STRING.CACHE.COMICS + "\(id)")
    }
    
    func cacheCharacterEvents(for id: Int, events: [CharacterEvents.Event]) {
        eventsCache.insert(events, forKey: CONST_STRING.CACHE.EVENTS + "\(id)")
    }
    
    func getCachedCharacterEvents(for id: Int) -> [CharacterEvents.Event]? {
        return eventsCache.value(forKey: CONST_STRING.CACHE.EVENTS + "\(id)")
    }

    func cacheCharacterStories(for id: Int, stories: [CharacterStories.Story]) {
        storiesCache.insert(stories, forKey: CONST_STRING.CACHE.STORIES + "\(id)")
    }
    
    func getCachedCharacterStories(for id: Int) -> [CharacterStories.Story]? {
        return storiesCache.value(forKey: CONST_STRING.CACHE.STORIES + "\(id)")
    }

    func cacheCharacterSeries(for id: Int, series: [CharacterSeries.Series]) {
        seriesCache.insert(series, forKey: CONST_STRING.CACHE.SERIES + "\(id)")
    }
    
    func getCachedCharacterSeries(for id: Int) -> [CharacterSeries.Series]? {
        return seriesCache.value(forKey: CONST_STRING.CACHE.SERIES + "\(id)")
    }

}
