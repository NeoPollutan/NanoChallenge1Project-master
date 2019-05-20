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
        
        
        //currentButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        //view.addSubview(currentButton)

    }
    
    func gameOver()
    {
        state = GameState.gameOver
        scoreLabel.textColor = .yellow
        setupFreshGameState()
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
    
    
//    var allButtons = [UIButton]()
//    var status: String = ""
//
//    enum gameState
//    {
//        case finished
//        case playing
//    }
//
//    var state = gameState.finished
//
//
    
    

    
    
    
//    var timer: Timer?
//    var currentButton: UIButton!
//
//
//
//
//
//
//  func displayRandomButton()
//  {
//    for myButton in allButtons {
//        myButton.isHidden = true
//    }
//    let buttonIndex = Int.random(in: 0..<allButtons.count)
//    currentButton = allButtons[buttonIndex]
//    currentButton.center = CGPoint(x: randomYCoordinate(), y: randomYCoordinate())
//    currentButton.isHidden = false
//    }
//
//
//    func finished() {
//        outletStartPlayButton.isHidden=false
//        state = gameState.finished
//        status = "FAILED"
//        updateStatus(status)
//        statusButton.textColor = .white
//        freshGameState()
//    }
//
//
//   func freshGameState()
//   {
//    outletStartPlayButton.isHidden=false
//    statusButton.isHidden = true
//    for myButton in allButtons {
//        myButton.isHidden = true
//    }
//    currentButton = correctButton1
//    state = gameState.finished
//    }
//
//
//    func randCGFloat(_ min: CGFloat, _ max: CGFloat) -> CGFloat
//    {
//        return CGFloat.random(in: min..<max)
//    }
//
//    func randomXCoordinate() -> CGFloat
//    {
//        let left = view.safeAreaInsets.left + currentButton.bounds.width
//        let right = view.bounds.width  - view.safeAreaInsets.right - currentButton.bounds.width
//        return randCGFloat(left, right)
//    }
//
//    func  randomYCoordinate() -> CGFloat {
//        let top = view.safeAreaInsets.top + currentButton.bounds.height
//        let bottom = view.bounds.height - view.safeAreaInsets.bottom - currentButton.bounds.height
//        return randCGFloat(top, bottom)
//    }
//
//    func updateStatus(_ newLabel: String)
//    {
//        statusButton.isHidden = false
//        statusButton.text = "\(newLabel)"
//    }
//
//
//    func startNewGame()
//    {
//        outletStartPlayButton.isHidden = true
//        updateStatus(status)
//        statusButton.isHidden = false
//        gameRunning()
//    }
//
//
//    func gameRunning ()
//    {
//        updateStatus(status)
//        displayRandomButton()
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false)
//        {
//            _ in if self.state == gameState.playing
//            {
//                if self.currentButton == self.correctButton1
//                {
//                    self.finished()
//                } else{
//               self.gameRunning()
//                }
//            }
//        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

