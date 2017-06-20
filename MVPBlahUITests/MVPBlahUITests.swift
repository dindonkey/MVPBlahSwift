//
//  MVPBlahUITests.swift
//  MVPBlahUITests
//
//  Created by Simone Caldon on 25/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import XCTest
import MockWebServer

class MVPBlahUITests: XCTestCase {
    
    let homePage = HomePage()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
        homePage.shutdown()
    }
    
    func testLoadedDataIsShow() {
        homePage.enqueueJsonResoponse("jokes.json")
        homePage.launch()
        homePage.checkTextIsDisplayed("CNN")
    }

}
