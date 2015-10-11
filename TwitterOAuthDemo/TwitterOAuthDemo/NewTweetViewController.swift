//
//  NewTweetViewController.swift
//  TwitterOAuthDemo
//
//  Created by Nilesh on 10/11/15.
//  Copyright © 2015 CA. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController,UINavigationBarDelegate {


    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()

        displayName.text = User.currentUser?.name
        profileImage.setImageWithURL(NSURL(string: (User.currentUser?.profileImageURL)!))
        textView.text = " "
        textView.layer.shadowRadius = 2.0
        textView.layer.shadowColor = UIColor.grayColor().CGColor
        textView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setNavigationController(){
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.bounds.size.width, 64)) // Offset by 20 pixels vertically to take the status bar into account

        navigationBar.backgroundColor = UIColor.whiteColor()
        navigationBar.delegate = self;

        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "New Tweet"

        // Create left and right button for navigation item
        let leftButton =  UIBarButtonItem(title: "Cancel", style:   UIBarButtonItemStyle.Plain, target: self, action: "onCancel")
        let rightButton = UIBarButtonItem(title: "Tweet", style: UIBarButtonItemStyle.Plain, target: self, action: "onTweet")

        // Create two buttons for the navigation item
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton

        //Bar Color Setup
        navigationBar.barTintColor = UIColor(red:0.33, green:0.67, blue:0.93, alpha:1.0)
        leftButton.tintColor = UIColor.whiteColor()
        rightButton.tintColor = UIColor.whiteColor()
        navigationBar.titleTextAttributes = NSDictionary.init(dictionary:
            [NSForegroundColorAttributeName:UIColor.whiteColor()]) as? [String : AnyObject]

        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]

        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
    }

    func onCancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func onTweet(){
        let storyBoard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("TweetsViewController")
        self.presentViewController(viewController, animated: true, completion: nil)
    }


    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.


    }
*/

}
