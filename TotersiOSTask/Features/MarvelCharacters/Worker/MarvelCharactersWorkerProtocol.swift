//
//  MarvelCharactersWorkerProtocol.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import Foundation

protocol MarvelCharactersWorkerProtocol: AnyObject {
    func fetchAllMarvelCharacters(request: URLRequestBuilder, onFetch: @escaping (Result<CharactersList.Response, ResponseError>) -> Void)
}


