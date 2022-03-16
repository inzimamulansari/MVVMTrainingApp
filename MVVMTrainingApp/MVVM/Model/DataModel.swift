//
//  DataModel.swift
//  MVVMTrainingApp
//
//  Created by Apple on 15/03/22.
//

import Foundation


struct countryModel: Codable {
    let code: Int?
    let result: [countryListModel]?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case result
    }
}
struct countryListModel: Codable {
    let code: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}

public enum RequestType: String {
    case GET, POST, PUT,DELETE
}
