//
//  ViewController.swift
//  TwitterOAuthDemo
//
//  Created by Nilesh on 10/10/15.
//  Copyright © 2015 CA. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()



        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginWithTwitter(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion(){
            (user:User?,error:NSError?) in
            if user != nil{
                self.performSegueWithIdentifier("loginSegue", sender: sender)
            }else{
                //handle login error.
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

