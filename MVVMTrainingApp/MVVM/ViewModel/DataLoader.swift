//
//  DataLoader.swift
//  MVVMTrainingApp
//
//  Created by Apple on 15/03/22.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire
import RxAlamofire
import UIKit

class APIRequest {
    let baseURL = URL(string: Constant.baseurl)!
    var method = RequestType.GET
    var parameters = [String: String]()
    
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = RequestType.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
    
//MARK: - Api calling
class APICalling {
    
    
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: countryModel = try JSONDecoder().decode(countryModel.self, from: data ?? Data())
                    observer.onNext( model.result as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

