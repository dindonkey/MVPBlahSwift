//
//  MVPBlahUITests.swift
//  MVPBlahUITests
//
//  Created by Simone Caldon on 25/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import XCTest

class MVPBlahUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadingIsShown() {
        app.launch()
        
        XCTAssert(app.staticTexts["loading"].exists)
    }
    
    func testLoadedDataIsShow() {
        app.launchEnvironment["USE_IMMEDIATE_SCHEDULERS"] = "YES"
        app.launch()

        XCTAssert(app.staticTexts["Meh"].exists)
    }
    
}
