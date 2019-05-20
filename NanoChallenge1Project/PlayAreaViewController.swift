//
//  PlayAreaViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 18/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit

class PlayAreaViewController: UIViewController {
    
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var badButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var gameButtons = [UIButton]()
    var gamePoints = 0
    
    enum GameState {
        case gameOver
        case playing
    }
    
    var state = GameState.gameOver
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.isHidden = true
        gameButtons = [badButton,goodButton]
        setupFreshGameState()
}
    
    func startNewGame()
    {
        startGameButton.isHidden = true
        gamePoints = 0
        updateScoreLabel(gamePoints)
        scoreLabel.textColor = .orange
        scoreLabel.isHidden = false
        oneGameRound()
    }
    
    func oneGameRound()
    {
        updateScoreLabel(gamePoints)
        displayRandomButton()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            if self.state == GameState.playing
            {
                if self.currentButton  == self.goodButton {
                    self.gameOver()
                } else
                {
                    self.oneGameRound()
                }
            }
            
        }
    }
    
    @IBAction func startPressed(_ sender: Any) {
        state = GameState.playing
        startNewGame()
    }
    
    
    @IBAction func goodPressed(_ sender: Any) {
        gamePoints = gamePoints + 1
        updateScoreLabel(gamePoints)
        goodButton.isHidden = true
        timer?.invalidate()
        oneGameRound()
    }
    
    @IBAction func badPressed(_ sender: Any) {
        badButton.isHidden = true
        timer?.invalidate()
        gameOver()
    }
    
    var timer: Timer?
    var currentButton: UIButton!
    
    func displayRandomButton()
    {
        for myButton in gameButtons
        {
            myButton.isHidden = true
            
        }
        let buttonIndex = Int.random(in: 0..<gameButtons.count)
        currentButton = gameButtons[buttonIndex]
        currentButton.center = CGPoint (x: randomXCoordinate(), y: randomYCoordinate())
        currentButton.isHidden = false
        
    }
    
    func gameOver()
    {
        state = GameState.gameOver
        scoreLabel.textColor = .yellow
        performSegue(withIdentifier: "gameOverSegue", sender: self)
    }
    
    func setupFreshGameState()
    {
        startGameButton.isHidden = false
        for myButton in gameButtons
        {
            myButton.isHidden=true
        }
        currentButton = goodButton
        state = GameState.gameOver
    }
    
    func randCGFloat(_ min: CGFloat, _ max: CGFloat) -> CGFloat
        {
            return CGFloat.random(in: min..<max)
        }
    
        func randomXCoordinate() -> CGFloat
        {
            let left = view.safeAreaInsets.left + currentButton.bounds.width
            let right = view.bounds.width  - view.safeAreaInsets.right - currentButton.bounds.width
            return randCGFloat(left, right)
        }
    
        func  randomYCoordinate() -> CGFloat {
            let top = view.safeAreaInsets.top + currentButton.bounds.height
            let bottom = view.bounds.height - view.safeAreaInsets.bottom - currentButton.bounds.height
            return randCGFloat(top, bottom)
        }
    
    func updateScoreLabel(_ newValue: Int)
    {
        scoreLabel.text = "\(newValue)"
    }

    
    
    
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

