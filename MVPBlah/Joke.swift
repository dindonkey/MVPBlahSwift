//
// Created by xpuser on 02/03/2017.
// Copyright (c) 2017 Simone Caldon. All rights reserved.
//

import Foundation

struct Joke {
    var joke: String

    init(_ dictionary: Dictionary<String, AnyObject>) {
        joke = dictionary["joke"] as! String
    }
}