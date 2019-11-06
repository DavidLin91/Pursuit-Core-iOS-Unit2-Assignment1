//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var xPlayerStatus = TicTacToeBrain.init().xPlayer
    var winComboLogic = TicTacToeBrain.init().winCombo // all possible win combos
    var buttonPressed = [0, 0, 0, 0, 0, 0, 0, 0, 0] // keep track of buttons pressed
    var winningRowX = [Int]()
    var winningRowO = [Int]()
    @IBOutlet var gameButtons: [GameButton]!
    @IBOutlet weak var turnLabel: UILabel!
    var playingGame = true  // playing, no winner
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    resetGame()
  }

    @IBAction func gameButtonPressed(_ gameButton: GameButton) {
        
        if (buttonPressed[gameButton.tag] == 0) {  // tags start at 1 and index starts at 0
        buttonPressed[gameButton.tag] = 1 // sets button = 1 so you can no longer press it after use

        xPlayerStatus.toggle() // true
        if xPlayerStatus {
            gameButton.setImage(UIImage(named: "xdonut"), for: UIControl.State())
            turnLabel.text = "PLAYER TWO'S TURN (⭕️)"
            winningRowX.append(gameButton.tag)
            let setRowX = Set(winningRowX) // changed array to set to use .intersect
            for arr in winComboLogic {
                print(Array(setRowX.intersection(Set(arr))))
                if Array(setRowX.intersection(Set(arr))).sorted() == arr { // changed set back to array and sorted to compare to array
                print("player1 wins")
                  turnLabel.text = "PLAYER ONE WINS!"
                  buttonPressed = [1, 1, 1, 1, 1, 1, 1, 1, 2]
                } else if buttonPressed == [1, 1, 1, 1, 1, 1, 1, 1, 1]{
                    print("elseprint")
                    turnLabel.text = "D'🍩H!  IT'S A TIE"
                }
            }
            
        } else if xPlayerStatus == false {
            gameButton.setImage(UIImage(named: "odonut"), for: UIControl.State())
            turnLabel.text = "PLAYER ONE'S TURN (❌)"
             winningRowO.append(gameButton.tag)
            let setRowO = Set(winningRowO)
            for arr in winComboLogic {
                if Array(setRowO.intersection(Set(arr))).sorted() == arr {
                    turnLabel.text = "PLAYER TWO WINS!"
                    buttonPressed = [1, 1, 1, 1, 1, 1, 1, 1, 1]
                }
            }
        }
    }
}
 
    
    @IBAction func startButton(_ sender: UIButton) {
      resetGame()
    }
    
    func resetGame() {
        buttonPressed = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        turnLabel.text = "Player One's Turn (❌)"
        xPlayerStatus = false
        winningRowX = [Int]()
        winningRowO = [Int]()
        for button in gameButtons {
            button.setImage( nil, for: .normal)
        }
    }
}

