///**
/**
MercadoLibreOlgerTests
Created by: Olger Rosero on 14/10/20
Copyright (c)  Fincaraiz.com.co
*/

import XCTest
@testable import MercadoLibreOlger

class MercadoLibreOlgerTests: XCTestCase {

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
    
    func testListingInteractor(){
        let mockListingPresenter = MockListingPresenter()
        let interactor: ListingInteractorInputProtocol = ListingInteractor()
        interactor.presenter = mockListingPresenter
        interactor.search("camisas")
        wait(for: [mockListingPresenter.expectationResults], timeout: 10.0)
        XCTAssertNotNil(mockListingPresenter.results, "no se pudo obtener items")
    }
    
}


class MockListingPresenter: ListingInteractorOutputProtocol {
     
    var expectationResults = XCTestExpectation(description: "test api products ")
    var results: Array<Result>?
    
    func onSuccess(results: Array<Result>) {
        self.results = results
        expectationResults.fulfill()
        
    }
    
    func onError(error: ErrorApi) {
        expectationResults.fulfill()
    }
    
}
