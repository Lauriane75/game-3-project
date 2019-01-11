//
//  Colossus.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

class Colossus: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 400,attackPoints: 5, weapon:Hammer(), type: "Colossus", fullLifeBar: 400)
    }
}