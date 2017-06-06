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
    
    let app = XCUIApplication()
    var mockWebServer: MockWebServer?


    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        mockWebServer = MockWebServer()
        mockWebServer!.start(9000)
    }
    
    override func tearDown() {
        super.tearDown()
        mockWebServer!.stop()
    }

    //non ha più senso, in teoria se usi immediate non vedi lo stato di caricamento
//    func testLoadingIsShown() {
//        app.launch()
//
//        XCTAssert(app.staticTexts["loading"].exists)
//    }
    
    func testLoadedDataIsShow() {

        let jokesDispatch: Dispatch = Dispatch()
        jokesDispatch.requestContain("jokes/random")
                .setResponseCode(200)
                .responseBody(for: Bundle(for: object_getClass(self)), fromFile: "jokes.json")

        let dispatchMap = DispatchMap()
        dispatchMap.add(jokesDispatch)
        mockWebServer!.setDispatch(dispatchMap)


        app.launchEnvironment[AppDelegate.USE_IMMEDIATE_SCHEDULERS] = "YES"
        app.launchEnvironment[AppDelegate.USE_MOCK_WEB_SERVER] = "YES"
        app.launch()

        XCTAssert(app.staticTexts.element(matching: NSPredicate(format: "label CONTAINS 'CNN'")).exists)

    }
    
    // useful for debug:
    // print(XCUIApplication().debugDescription)
}
