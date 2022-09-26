//
//  MarvelCharactersWorker.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 25/09/2022.
//

import Foundation

class MarvelCharactersWorker: MarvelCharactersWorkerProtocol {
    
    let networkManager: APIRequestHandler
    
    init(networkManager: APIRequestHandler) {
        self.networkManager = networkManager
    }
    
    func fetchAllMarvelCharacters(request: URLRequestBuilder, onFetch: @escaping (Result<CharactersList.Response, ResponseError>) -> Void) {
        networkManager.send(request, CharactersList.Response.self) { response in
            switch response {
            case .success(let value):
                onFetch(.success(value))
            case .failure(let error):
                onFetch(.failure(error))
            }
        }
    }
}
