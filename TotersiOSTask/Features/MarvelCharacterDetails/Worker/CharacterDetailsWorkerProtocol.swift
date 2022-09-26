//
//  CharacterDetailsWorkerProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol CharacterDetailsWorkerProtocol: AnyObject {
    func fetchCharacterDetails(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterDetails.Response, ResponseError>) -> Void)
    func fetchCharacterComics(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterComics.Response, ResponseError>) -> Void)
    func fetchCharacterEvents(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterEvents.Response, ResponseError>) -> Void)
    func fetchCharacterStories(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterStories.Response, ResponseError>) -> Void)
    func fetchCharacterSeries(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterSeries.Response, ResponseError>) -> Void)
}
