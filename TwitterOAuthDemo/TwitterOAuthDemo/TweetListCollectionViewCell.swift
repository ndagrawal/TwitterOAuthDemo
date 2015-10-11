//
//  TweetListCollectionViewCell.swift
//  TwitterOAuthDemo
//
//  Created by Nilesh on 10/11/15.
//  Copyright © 2015 CA. All rights reserved.
//

import UIKit


class TweetListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var displayName  : UILabel!
    @IBOutlet weak var profileName  : UILabel!
    @IBOutlet weak var tweetText    : UILabel!
    @IBOutlet weak var createdATText: UILabel!

    func setCellUI(){
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.grayColor().CGColor
    }

    func setUpCollectionViewCell(tweet:Tweet){
        //setCellUI()
        profileImage.setImageWithURL(NSURL(string: (tweet.user?.profileImageURL)!))
        //profileImage.imageWithURL(NSURL(string: tweet.user?.profileImageURL))

        displayName.text = "@"+(tweet.user?.screenname)!
        profileName.text = tweet.user?.name
        tweetText.text = tweet.text
       // createdATText.text = tweet.createdAtString
    }
}
