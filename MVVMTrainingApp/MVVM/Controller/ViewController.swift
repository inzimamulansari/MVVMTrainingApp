//
//  ViewController.swift
//  MVVMTrainingApp
//
//  Created by Apple on 15/03/22.
//


import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController,UITableViewDelegate {

private let apiCalling = APICalling()
private let disposeBag = DisposeBag()
    
        @IBOutlet var tab:UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
            tab.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            let request =  APIRequest()
            let result : Observable<[countryListModel]> = self.apiCalling.send(apiRequest: request)
            _ = result.bind(to: tab.rx.items(cellIdentifier: "cell")) { ( row, model, cell) in
               cell.textLabel?.text = model.name
            }
        }
    
}

