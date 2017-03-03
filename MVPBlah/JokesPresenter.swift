//
// Created by xpuser on 02/03/2017.
// Copyright (c) 2017 Simone Caldon. All rights reserved.
//

import Foundation
import RxSwift

class JokesPresenter {

    let jokesRepository: JokesRepository
    let schedulerManager: SchedulerManager
    var view: JokesView?
    let disposeBag = DisposeBag()

    init(jokesRepository: JokesRepository, schedulerManager: SchedulerManager)
    {
        self.jokesRepository = jokesRepository
        self.schedulerManager = schedulerManager
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

    func bindView(view: JokesView) {
        self.view = view
    }
//
//    func unbindView() {
//        self.view = nil
//    }
}