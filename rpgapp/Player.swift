//
//  Player.swift
//  rpgapp
//
//  Created by Carlos Flores Guardado on 9/12/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    var inventory: [String] {
        return _inventory
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        self._name = name
    }
    
    
    
}