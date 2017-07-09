//
// Created by xpuser on 02/03/2017.
// Copyright (c) 2017 Simone Caldon. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire
import Moya
import Moya_ModelMapper

class JokesPresenter {
    
    let jokesRepository: JokesRepository
    let schedulerManager: SchedulerManager
    var view: JokesView?
    let disposeBag : DisposeBag
    
    init(jokesRepository: JokesRepository, schedulerManager: SchedulerManager, disposeBag: DisposeBag)
    {
        self.jokesRepository = jokesRepository
        self.schedulerManager = schedulerManager
        self.disposeBag = disposeBag
    }
    
    func getJokes() {
        jokesRepository.getJoke()
            .subscribeOn(schedulerManager.computation)
            .observeOn(schedulerManager.main)
            .subscribe(onNext: { (element) in
                let respDict = element as! Dictionary<String, AnyObject>
                let jokes = respDict["value"] as! Array<AnyObject>
                
                let joke = Joke(jokes.first as! Dictionary<String,AnyObject>)
                self.view!.showJokes(joke: joke)
            })
            .addDisposableTo(disposeBag)
    }
    
//    func getJokesWithAlamo() {
//        jokesRepository.getJokeWithAlamo()
//            .subscribeOn(schedulerManager.computation)
//            .observeOn(schedulerManager.main)
//            .debug()
//            .subscribe(onNext: { (dataRequest) in
//                dataRequest.responseArray(keyPath: "value") { (response: DataResponse<[Joke]>) in
//                    let joke = response.result.value?.first
//                    self.view!.showJokes(joke: joke)
//                }
//            })
//            .addDisposableTo(disposeBag)
//    }
    
    func getJokesWithMoya() {
        let jokesProvider = MoyaProvider<JokesService>()
        jokesProvider.request(.random) { result in
            switch result {
            case let .success(response):
                // do catch seems mandatory because mapArray is throwing exception
                do {
                    let jokes = try response.mapArray(withKeyPath: "value") as [Joke]
                    self.view!.showJokes(joke: jokes.first)
                }
                catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func bindView(view: JokesView) {
        self.view = view
    }
    //
    //    func unbindView() {
    //        self.view = nil
    //    }
}
