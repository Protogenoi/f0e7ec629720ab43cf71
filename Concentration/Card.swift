//
//  Card.swift
//  Concentration
//
//  Created by Michael Owen on 20/12/2017.
//  Copyright © 2017 Michael Owen. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
