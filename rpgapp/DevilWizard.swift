//
//  DevilWizard.swift
//  rpgapp
//
//  Created by Carlos Flores Guardado on 9/14/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand","Dark Amulet","Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}