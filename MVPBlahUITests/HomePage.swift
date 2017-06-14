//
//  HomePage.swift
//  MVPBlah
//
//  Created by xpuser on 06/06/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import Foundation
import MockWebServer

class HomePage {
    var mockWebServer: MockWebServer?
    
    func launchHome() {
        
    }
    
    func enqueueJsonResoponse(_ filePath: String)
    {
        let jokesDispatch: Dispatch = Dispatch()
        jokesDispatch.requestContain("jokes/random")
            .setResponseCode(200)
            .responseBody(for: Bundle(for: object_getClass(self)), fromFile: filePath)
        
        let dispatchMap = DispatchMap()
        dispatchMap.add(jokesDispatch)
        mockWebServer!.setDispatch(dispatchMap)

    }
    
}
