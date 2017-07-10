//
//  JokesViewController.swift
//  MVPBlah
//
//  Created by Simone Caldon on 25/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import UIKit
import RxSwift

class JokesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, JokesView {
    
    var schedulerManager: SchedulerManager?
    
    @IBOutlet var sampleTableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    var tableData = ["loading"]
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let jokesPresenter = JokesPresenter(jokesRepository: appDelegate.jokesRepository!, schedulerManager: appDelegate.schedulerManager!, disposeBag: disposeBag)
        jokesPresenter.bindView(view: self)
        //        jokesPresenter.getJokes()
//        jokesPresenter.getJokesWithAlamo()
//        jokesPresenter.getJokesWithMoya()
        jokesPresenter.getJokesWithMoyaRx()
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
    
    func showJokes(joke: Joke?) {
        if let joke = joke?.joke {
            self.tableData = [joke]
            self.sampleTableView.reloadData()
        }
    }
    
    
}

