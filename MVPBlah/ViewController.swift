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
    let tableData = ["loading"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
        
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

