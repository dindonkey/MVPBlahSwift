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

class JokesRepository {
    
    var baseUrl : String
    
    init(_ baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getJokeWithAlamo() -> Observable<DataRequest> {
        return RxAlamofire.request(.get, URL(string: baseUrl + "/jokes/random/1")!)
    }
    
    func getJoke() -> Observable<Any> {
        Thread.sleep(forTimeInterval: 3)
        return URLSession.shared.rx.json(url: URL(string: baseUrl + "/jokes/random/1")!)
    }
    
}
