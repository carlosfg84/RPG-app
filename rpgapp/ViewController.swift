//
//  ViewController.swift
//  rpgapp
//
//  Created by Carlos Flores Guardado on 9/12/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printlbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestmsg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "DirtyLaundry21", hp: 110, attackPwr: 20)
        playerHpLbl.text = "\(player.hp) HP"
        
        generateRandomEnemy()
        
    }
    
    func generateRandomEnemy() {
        printlbl.text = "Attack!"
        enemyImg.hidden = false
        let rand = Int(arc4random_uniform(UInt32(2)))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 12)
            enemyHpLbl.text = "\(enemy.hp) HP"
        }
        
    }

    
    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printlbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
            
        } else {
            printlbl.text = "Attack was unsuccessful"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestmsg = "\(player.name) found \(loot)"
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printlbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
            chestBtn.hidden = false
        }
        
    }
    
    
    @IBAction func onChestTapped(sender: AnyObject) {
        
        chestBtn.hidden = true
        printlbl.text = chestmsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
    }



}

