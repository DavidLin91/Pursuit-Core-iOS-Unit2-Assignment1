//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameButtons: [GameButton]!
    
    
    
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        print("row \(gameButton.row) at column \(gameButton.col) was selected")
    }
    
}

