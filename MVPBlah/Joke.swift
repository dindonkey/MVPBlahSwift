//
// Created by xpuser on 02/03/2017.
// Copyright (c) 2017 Simone Caldon. All rights reserved.
//

import Foundation
import Mapper

struct Joke: Mappable{
    var joke: String?
    
    init(_ dictionary: Dictionary<String, AnyObject>) {
        joke = dictionary["joke"] as? String
    }
    
    init(map: Mapper) throws {
        joke = map.optionalFrom("joke")
    }
   
}
