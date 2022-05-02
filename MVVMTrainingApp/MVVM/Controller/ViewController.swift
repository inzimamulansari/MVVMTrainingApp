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
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Countries"
        
        view.addSubview(tableView)
        
        if Reachability.isConnectedToNetwork(){
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            let request =  APIRequest()
            let result : Observable<[countryListModel]> = self.apiCalling.send(apiRequest: request)
            _ = result.bind(to: tableView.rx.items(cellIdentifier: "cell")) { ( row, model, cell) in
                cell.textLabel?.text = model.name
            }
        }
        else
        {// no internet
            let alert = UIAlertController(title: Constant.noInternet, message: Constant.AlertMsg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        tableView.rx.setDelegate(self) .disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}

