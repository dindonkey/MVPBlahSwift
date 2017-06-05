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

class JokesRepository {
    
    var baseUrl : String
    
    init(_ baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func getJoke() -> Observable<Any> {

        Thread.sleep(forTimeInterval: 3)
        return URLSession.shared.rx.json(url: URL(string: baseUrl + "/jokes/random/1")!)

//        return Observable<String>.create { observer in
//
//            //TODO: serve farlo per forza qui ??
//            // UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//            let url = URL(string: "http://api.icndb.com/jokes/random/1")
//            let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
//            var dataTask: URLSessionDataTask?
//            dataTask = defaultSession.dataTask(with: url!) { data, response, error in
//
//                //TODO: serve farlo per forza qui ??
//                //  dispatch_async(dispatch_get_main_queue()) {
//                //                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                //            }
//
//                if let error = error {
//                    print(error.localizedDescription)
//                    observer.onError(error)
//                } else if let httpResponse = response as? HTTPURLResponse {
//                    if httpResponse.statusCode == 200 {
//                        observer.onNext("Meh joke")
//                        observer.onCompleted()
//                    } else {
//                        observer.onError(HttpStatusError.Not200Error)
//                    }
//                }
//            }
//            return Disposables.create()
//        }



    }

    enum HttpStatusError: Error {
        case Not200Error
    }

}
