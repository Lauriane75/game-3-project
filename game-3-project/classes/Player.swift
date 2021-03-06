//
//  Players.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation
class Player {
    var namePlayer: String
    // will create a team of 3 character by player only characters alive
    public var arrayCharacter = [Character]()
    init(namePlayer: String) {
        self.namePlayer = namePlayer
    }
    public var arrayDeadCharacter: [Character] = [Character]()
    // To show the results of each character
    func statsOfFights() {
        for (array, item) in arrayCharacter.enumerated() where item.defensePoints >= 1 {
                if item is Fighter || item is Colossus || item is Dwarf || item is GiantDwarf || item is WalkingDead {
                    print("""
                        \(array + 1) \(item.type) \(item.nameCharacter)
                        Attack : \(item.weapon.injuries)
                        Defense : \(item.defensePoints) / \(item.fullLifeBar) points
                        """)
                } else if item is Magus {
                    print("""
                        \(array+1) \(item.type) \(item.nameCharacter)
                            Healing : \(item.weapon.healing)
                        Defense : \(item.defensePoints) / \(item.fullLifeBar) points
                        """)
               // } else { // If the character is <= 0
              //  print("\(i+1) The \(item.type) \(item.nameCharacter), is //
                    // dead, find something to bring it back to life.")
                }
        }
    }
    // To show dead characters of each player
    func showDeadCharacters() {
        print ("Dead people :")
        for (_, item) in arrayDeadCharacter.enumerated() {
            arrayDeadCharacter = arrayDeadCharacter.filter { $0.defensePoints <= 0 }
            print ("\(item.nameCharacter)  \(item.type)  Defense: \(item.defensePoints)  Attack: \(item.attackPoints)")
        }
    }
    // to bring a dead character back to life and transform him in a walking dead newcharacter
    func zombiePotion(character: Character) {
        let random = arc4random_uniform(100)
        if character.defensePoints >= 1 {
            if random <= 5 {
                print ("+++++++++++++++++")
                print ("+ Zombie Potion +")
                print ("+++++++++++++++++")
                print ("""
                    \(namePlayer)'s just found a Zombie Potion!\nUse it to
                    bring your last dead budy back to life and transform him in a Walking Dead
                    """)
                showDeadCharacters()
                if var dead = lastDeadCharacter() {
                    print ("""
                        Great ! Your \(dead.type) \(dead.nameCharacter) got back to life and has
                        transformed in zombie\nWelcome to your new character \(dead.nameCharacter) the walking dead
                        """)
                    dead.defensePoints = 300
                    arrayDeadCharacter = arrayDeadCharacter.filter { $0.defensePoints <= 0 }
                    dead = WalkingDead(name: dead.nameCharacter)
                    arrayCharacter.append(dead)
                } else {
                    print ("==> Sorry you don't have any dead guy.")
                }
            }
        }
    }
    // to bring a dead character back to life and have 100% full life bar
    func magicElixir() {
        let random = arc4random_uniform(100)
            if random <= 5 {
                print ("++++++++++++++++")
                print ("+ Magic Elixir +")
                print ("++++++++++++++++")
                print ("\(namePlayer)'s just found an Elixir!\nUse it to bring your last dead budy back to life")
                showDeadCharacters()
                if let dead = lastDeadCharacter() {
                    dead.defensePoints = dead.fullLifeBar
                    arrayDeadCharacter = arrayDeadCharacter.filter { $0.defensePoints <= 0 }
                    print ("Great ! Your \(dead.type) \(dead.nameCharacter) got back to life! ")
                    arrayCharacter.append(dead)
                } else {
                    print ("=> Sorry \(namePlayer), you don't have any dead guy.")
                }
            }
        }
    func lastDeadCharacter() -> Character? {
        return arrayDeadCharacter.last
    }
    func characterChoice() -> Int {
        var currentCharacterChoice = 0
        repeat {
            if let strData = readLine() {
                if let strData = Int(strData) {
                    currentCharacterChoice = strData
                }
            }
        } while currentCharacterChoice != 1 && currentCharacterChoice != 2 && currentCharacterChoice != 3
        return currentCharacterChoice
    }
} // End of Player class
