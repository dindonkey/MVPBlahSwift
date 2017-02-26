//
//  File.swift
//  MVPBlah
//
//  Created by Simone Caldon on 26/02/2017.
//  Copyright © 2017 Simone Caldon. All rights reserved.
//

import Foundation
import RxSwift

class SchedulerManager {
    
    public var computation: SchedulerType
    public var main: SchedulerType
    
    init(computation: SchedulerType, main: SchedulerType) {
        self.computation = computation
        self.main = main
    }
}
