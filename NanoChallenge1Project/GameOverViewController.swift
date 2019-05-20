//
//  GameOverViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 20/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "reloadSegue", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
