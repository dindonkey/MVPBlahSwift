//
//  HomePage.swift
//  MVPBlah
//
//  Created by xpuser on 06/06/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import XCTest
import Foundation
import MockWebServer

public class HomePage {
    let app = XCUIApplication()
    let mockWebServer = MockWebServer()
    
    func launch() {
        mockWebServer.start(9000)
        app.launchEnvironment[AppDelegate.USE_IMMEDIATE_SCHEDULERS] = "YES"
        app.launchEnvironment[AppDelegate.USE_MOCK_WEB_SERVER] = "YES"
        app.launch()
    }
    
    func enqueueJsonResoponse(_ filePath: String)
    {
        let jokesDispatch: Dispatch = Dispatch()
        jokesDispatch.requestContain("jokes/random")
            .setResponseCode(200)
            .responseBody(for: Bundle(for: object_getClass(self)), fromFile: filePath)
        
        let dispatchMap = DispatchMap()
        dispatchMap.add(jokesDispatch)
        mockWebServer.setDispatch(dispatchMap)

    }
    
    func checkTextIsDisplayed(_ text: String)
    {
        XCTAssert(app.staticTexts.element(matching: NSPredicate(format: "label CONTAINS '" + text + "'")).exists)
    }
    
    func shutdown()
    {
        mockWebServer.stop()
    }
    
    // useful for debug:
    // print(XCUIApplication().debugDescription)
    
}
