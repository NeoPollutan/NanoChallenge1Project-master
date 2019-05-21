//
//  LoadingViewController.swift
//  NanoChallenge1Project
//
//  Created by Rizky Adipratama Ruddyar on 21/05/19.
//  Copyright © 2019 Rizky Adipratama Ruddyar. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet var Star3: UIImageView!
    @IBOutlet var Star2: UIImageView!
    @IBOutlet var Star1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...6
        {
            if(i%3 == 1)
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                    self.Star1.isHidden = !self.Star1.isHidden
                }
            }
            else
            if(i%3 == 2)
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                    self.Star2.isHidden = !self.Star2.isHidden
                }
            }
            else
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                    self.Star3.isHidden = !self.Star3.isHidden
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            for i in 1...6
            {
                if(i%3 == 1)
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                        self.Star1.isHidden = !self.Star1.isHidden
                    }
                }
                else
                    if(i%3 == 2)
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                            self.Star2.isHidden = !self.Star2.isHidden
                        }
                    }
                    else
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                            self.Star3.isHidden = !self.Star3.isHidden
                        }
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.performSegue(withIdentifier: "backToStartSegue", sender: self)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) {
            for i in 1...6
            {
                if(i%3 == 1)
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                        self.Star1.isHidden = !self.Star1.isHidden
                    }
                }
                else
                    if(i%3 == 2)
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                            self.Star2.isHidden = !self.Star2.isHidden
                        }
                    }
                    else
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(i*500)) {
                            self.Star3.isHidden = !self.Star3.isHidden
                        }
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
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
