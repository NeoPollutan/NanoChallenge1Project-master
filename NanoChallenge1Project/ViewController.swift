//
//  ViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 18/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func playButtonClick(_ sender: Any) {
    print("button pressed...")
        
    self.performSegue(withIdentifier: "playAreaSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

