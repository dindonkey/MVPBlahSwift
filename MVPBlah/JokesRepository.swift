//
//  JokesRepository.swift
//  MVPBlah
//
//  Created by xpuser on 27/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire
import AlamofireObjectMapper
import Moya
import Moya_ModelMapper

class JokesRepository {
    
    var baseUrl : String
    let jokesProvider: RxMoyaProvider<JokesService>
    
    init(baseUrl: String, jokesProvider: RxMoyaProvider<JokesService>) {
        self.baseUrl = baseUrl
        self.jokesProvider = jokesProvider
    }
    
    func getJokeWithAlamo() -> Observable<DataRequest> {
        return RxAlamofire.request(.get, URL(string: baseUrl + "/jokes/random/1")!)
    }
    
    func getJoke() -> Observable<Any> {
        Thread.sleep(forTimeInterval: 3)
        return URLSession.shared.rx.json(url: URL(string: baseUrl + "/jokes/random/1")!)
    }
    
    func getJokes() -> Observable<[Joke]> {
        return jokesProvider
            .request(.random(numJokes: 5))
            .mapArray(type: Joke.self, keyPath: "value")
    }
    
}
