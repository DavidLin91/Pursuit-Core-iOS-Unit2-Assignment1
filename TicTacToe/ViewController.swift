//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var xPlayer = false // false = "x"
    
    var buttonPressed = [0, 0, 0, 0, 0, 0, 0, 0, 0] // keep track of buttons pressed
    
    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var turnLabel: UILabel!
    
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    turnLabel.text = "Player One Turn (❌)"
  }

    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        
        if (buttonPressed[gameButton.tag] == 0) {  // tags start at 1 and index starts at 0
        
        buttonPressed[gameButton.tag] = 1 // sets button = 1 so you can no longer press it after use
            
        xPlayer.toggle()
        if xPlayer {
            gameButton.setImage(UIImage(named: "xdonut"), for: UIControl.State())
            turnLabel.text = "PLAYER TWO'S TURN (⭕️)"
        } else {
            gameButton.setImage(UIImage(named: "odonut"), for: UIControl.State())
            turnLabel.text = "PLAYER ONE'S TURN (❌)"
        }
        }
    }
    
    
    
    @IBAction func startButton(_ sender: UIButton) {
       turnLabel.text = "Player One Turn (❌)"
        
    }
    
    
    
    
}

