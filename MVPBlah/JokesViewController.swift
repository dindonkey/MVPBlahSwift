//
//  JokesViewController.swift
//  MVPBlah
//
//  Created by Simone Caldon on 25/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya

class JokesViewController: UIViewController, JokesView {
    
    var schedulerManager: SchedulerManager?
    
    @IBOutlet var sampleTableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    var tableData = Variable<[Joke]>([])
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let jokesPresenter = JokesPresenter(jokesRepository: appDelegate.jokesRepository!,
                                            schedulerManager: appDelegate.schedulerManager!,
                                            disposeBag: disposeBag)
        jokesPresenter.bindView(view: self)
        
        tableData
            .asObservable()
            .bindTo(sampleTableView.rx.items(cellIdentifier: textCellIdentifier, cellType: UITableViewCell.self))
            { (row, element, cell) in
                let joke = element as Joke
                cell.textLabel?.text = joke.joke
            }
            .addDisposableTo(disposeBag)
        
        jokesPresenter.getJokesWithMoyaRx()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showJokes(_ jokes: [Joke]) {
        self.tableData.value = jokes
    }
    
    
}

