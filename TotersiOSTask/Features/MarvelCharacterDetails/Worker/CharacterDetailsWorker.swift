//
//  CharacterDetailsWorker.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

class CharacterDetailsWorker: CharacterDetailsWorkerProtocol {
    
    let networkManager: APIRequestHandler
    
    init(networkManager: APIRequestHandler) {
        self.networkManager = networkManager
    }
    
    func fetchCharacterDetails(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterDetails.Response, ResponseError>) -> Void) {
        networkManager.send(request, CharacterDetails.Response.self) {
            [weak self] response in
            guard let self = self else {return}
            self.handleResponse(response: response, onFetch: onFetch)
        }
    }
    
    func fetchCharacterComics(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterComics.Response, ResponseError>) -> Void) {
        networkManager.send(request, CharacterComics.Response.self) {
            [weak self] response in
            guard let self = self else {return}
            self.handleResponse(response: response, onFetch: onFetch)
        }
    }
    
    func fetchCharacterEvents(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterEvents.Response, ResponseError>) -> Void) {
        networkManager.send(request, CharacterEvents.Response.self) {
            [weak self] response in
            guard let self = self else {return}
            self.handleResponse(response: response, onFetch: onFetch)
        }
    }
    
    func fetchCharacterStories(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterStories.Response, ResponseError>) -> Void) {
        networkManager.send(request, CharacterStories.Response.self) {
            [weak self] response in
            guard let self = self else {return}
            self.handleResponse(response: response, onFetch: onFetch)
        }
    }
    
    func fetchCharacterSeries(request: URLRequestBuilder, onFetch: @escaping (Result<CharacterSeries.Response, ResponseError>) -> Void) {
        networkManager.send(request, CharacterSeries.Response.self) {
            [weak self] response in
            guard let self = self else {return}
            self.handleResponse(response: response, onFetch: onFetch)
        }
    }
    
    private func handleResponse<T:APIResponse>(response: ServerResponse<T>, onFetch: @escaping (Result<T, ResponseError>) -> Void) {
        switch response {
        case .success(let value):
            onFetch(.success(value))
        case .failure(let error):
            onFetch(.failure(error))
        }
    }
    
}
