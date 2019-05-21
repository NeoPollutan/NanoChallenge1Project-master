//
//  PlayAreaViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 18/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit
import  AVFoundation

class PlayAreaViewController: UIViewController {
    
    @IBOutlet var startGameButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var badButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var emotImage: UIImageView!
    @IBOutlet var goodButton2: UIButton!
    @IBOutlet var badButton2: UIButton!
    @IBOutlet var badButton3: UIButton!
    @IBOutlet var goodButton3: UIButton!
    
    var myImage: [UIImage] =  []
    var imageView: [UIImageView] = []
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
        gameButtons = [badButton,goodButton,goodButton2,badButton2,goodButton3,badButton3]
        setupFreshGameState()
        
        for i in 0...19
        {
            myImage.append(UIImage(named: "emot\(i)")!)
        }
}
    
    func startNewGame()
    {
        startGameButton.isHidden = true
        gamePoints = 0
        updateScoreLabel(gamePoints)
        scoreLabel.textColor = .orange
        scoreLabel.isHidden = true
        oneGameRound()
    }
    
    func oneGameRound()
    {
        updateScoreLabel(gamePoints)
        displayRandomButton()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            if self.state == GameState.playing
            {
                if self.currentButton  == self.goodButton {
                    self.gameOver()
                } else if self.currentButton == self.goodButton2
                    {
                        self.gameOver()
                } else if self.currentButton == self.goodButton3
                {
                    self.gameOver()
                }
                else
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
        gamePoints += 1
        goodButton.isHidden = true
        timer?.invalidate()
        emotImage.image = myImage[gamePoints]
        if(gamePoints ==  19)
        {
           performSegue(withIdentifier: "finishViewSegue", sender: self)
        }
        oneGameRound()
    }
    
    @IBAction func badPressed(_ sender: Any) {
        badButton.isHidden = true
        timer?.invalidate()
        gameOver()
    }
    
    @IBAction func good2Pressed(_ sender: Any) {
        gamePoints += 1
        goodButton.isHidden = true
        timer?.invalidate()
        emotImage.image = myImage[gamePoints]
        if(gamePoints ==  19)
        {
            performSegue(withIdentifier: "finishViewSegue", sender: self)
        }
        oneGameRound()
    }
    
    @IBAction func bad2Pressed(_ sender: Any) {
        badButton.isHidden = true
        timer?.invalidate()
        gameOver()
    }
    @IBAction func good3Pressed(_ sender: Any) {
        gamePoints += 1
        goodButton.isHidden = true
        timer?.invalidate()
        emotImage.image = myImage[gamePoints]
        if(gamePoints ==  19)
        {
            performSegue(withIdentifier: "finishViewSegue", sender: self)
        }
        oneGameRound()
    }
    @IBAction func bad3Pressed(_ sender: Any) {
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
        UIDevice.vibrateHeavy()
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

extension UIDevice
{
    static func vibrateHeavy()
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
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

