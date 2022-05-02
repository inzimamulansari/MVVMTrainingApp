//
//  MVVMTrainingAppTests.swift
//  MVVMTrainingAppTests
//
//  Created by Apple on 15/03/22.
//

import XCTest
import RxCocoa
import RxSwift
@testable import MVVMTrainingApp

class MVVMTrainingAppTests: XCTestCase {
    
   
//    
    func test_ApiManager_Valid(){
        let apiCalling = APICalling()
        let request =  APIRequest()
        let result : Observable<[countryListModel]> = apiCalling.send(apiRequest: request)
        XCTAssertNotNil(result)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
