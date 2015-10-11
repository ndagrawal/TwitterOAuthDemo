//
//  TweetsViewController.swift
//  TwitterOAuthDemo
//
//  Created by Nilesh on 10/10/15.
//  Copyright © 2015 CA. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UINavigationBarDelegate {

    @IBOutlet weak var tweetsCollectionView: UICollectionView!
    var tweets:[Tweet]! = [Tweet]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetsCollectionView.delegate = self
        tweetsCollectionView.dataSource = self
        tweetsCollectionView.backgroundColor = UIColor.whiteColor()
        setCollectionViewLayout()

        setNavigationController()
        TwitterClient.sharedInstance.homeTimelineWithParams(nil,completion:{(tweets, error) -> () in
            self.tweets = tweets
            self.tweetsCollectionView.reloadData()
        })

    }

    func setNavigationController(){
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 0, self.view.bounds.size.width, 64)) // Offset by 20 pixels vertically to take the status bar into account

        //Navigation Bar Setup.
        navigationBar.delegate = self;
        //navigationBar.titleTextAttributes = NSDictionary.init(dictionary: [UItex: AnyObject])
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Tweets Feed"


        // Create left and right button for navigation item
        let leftButton =  UIBarButtonItem(title: "Log Out", style:   UIBarButtonItemStyle.Plain, target: self, action: "onLogOut:")
        let rightButton = UIBarButtonItem(title: "Tweet", style: UIBarButtonItemStyle.Plain, target: self, action: "onTweet")


        //Bar Color Setup
        navigationBar.barTintColor = UIColor(red:0.33, green:0.67, blue:0.93, alpha:1.0)
        leftButton.tintColor = UIColor.whiteColor()
        rightButton.tintColor = UIColor.whiteColor()
        navigationBar.titleTextAttributes = NSDictionary.init(dictionary:
            [NSForegroundColorAttributeName:UIColor.whiteColor()]) as? [String : AnyObject]


        // Create two buttons for the navigation item
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton

        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]


        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
    }
    func setCollectionViewLayout(){
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSizeMake(self.view.bounds.width, 130)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        tweetsCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
     return tweets.count
    }

    // The cell that is returned must be retrieved from a call 

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = tweetsCollectionView.dequeueReusableCellWithReuseIdentifier("TweetsCell", forIndexPath: indexPath) as! TweetListCollectionViewCell
        let tweet:Tweet = tweets[indexPath.row]
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 0.5
        cell.setUpCollectionViewCell(tweet)
        return cell
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onLogOut(sender: UIBarButtonItem) {
        User.currentUser?.logOut()
    }


    func onTweet(){
        let storyBoard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("NewTweetViewController")
        self.presentViewController(viewController, animated: true, completion: nil)
    }


    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "TweetDetailSegue"){
            let tweetDetailViewController:TweetDetailViewController = segue.destinationViewController as! TweetDetailViewController
            let cell = sender as! UICollectionViewCell
            let indexPath  = tweetsCollectionView!.indexPathForCell(cell) as NSIndexPath!
            let selectedTweet:Tweet = tweets[indexPath.row] as Tweet
            tweetDetailViewController.tweet  = selectedTweet
        }
    }


}
