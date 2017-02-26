//
//  ViewController.swift
//  MVPBlah
//
//  Created by Simone Caldon on 25/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var sampleTableView: UITableView!
    let textCellIdentifier = "TextCell"
    var tableData = ["loading"]
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
        getData()
    }
    
    func getData() {
        
        let schedulerManager = SchedulerManager(computation: ConcurrentDispatchQueueScheduler(qos: .default),
            main:MainScheduler())
        
        
        let observable = Observable<String>.create { (observer) -> Disposable in
            Thread.sleep(forTimeInterval: 3)
            observer.onNext("Meh")
            observer.onCompleted()
            return Disposables.create()
        }
        
        observable
            .subscribeOn(schedulerManager.computation)
            .observeOn(schedulerManager.main)
            .subscribe(onNext: { (element) in
                self.tableData = [element]
                self.sampleTableView.reloadData()
            })
            .addDisposableTo(disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = tableData[row]
        
        return cell
    }
    
    
}

