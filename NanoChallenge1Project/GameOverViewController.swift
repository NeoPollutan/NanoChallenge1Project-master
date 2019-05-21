//
//  GameOverViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 20/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit
import AVFoundation

class GameOverViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func viewDidDisappear(_ animated: Bool) {
        player.stop()
    }

    override func viewDidLoad() {
//        let session = AVAudioSession.sharedInstance()
//        do {
//            try session.setCategory(AVAudioSession.Category.playback)
//        }
//        catch {
//        }
//        player.play()
    
        super.viewDidLoad()
    let audiopath = Bundle.main.url(forResource: "laugh", withExtension: "mp3")
    do
    {
    player = try AVAudioPlayer(contentsOf: audiopath!)
    player.numberOfLoops = -1

    }
    catch {
    print(error)
    }
    player.play()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "reloadSegue", sender: self)
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


