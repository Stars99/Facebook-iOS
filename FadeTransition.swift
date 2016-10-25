//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    var blackView: UIView!
    var imageView: UIImageView!
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsfeedViewController = navigationController.topViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        newsfeedViewController.selectedImageView.isHidden = true
        photoViewController.photoViewControllerImageView.isHidden = true
        imageView = UIImageView()
        imageView.image = newsfeedViewController.selectedImageView.image
        let frame = containerView.convert(newsfeedViewController.selectedImageView.frame, from: newsfeedViewController.selectedImageView.superview)
        imageView.frame = frame
        imageView.contentMode = newsfeedViewController.selectedImageView.contentMode
        imageView.clipsToBounds = newsfeedViewController.selectedImageView.clipsToBounds
        blackView = UIView()
        blackView.frame = CGRect(x: 0, y: 0, width: toViewController.view.frame.size.width, height: toViewController.view.frame.size.height)
        
        blackView.frame = CGRect(x: 3, y: 3, width: toViewController.view.frame.size.width, height: toViewController.view.frame.size.height)
        toViewController.view.alpha = 0
        // toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        blackView.backgroundColor = UIColor(white: 0, alpha: 0)
        fromViewController.view.addSubview(imageView)
        
        let destinationImageFrame = photoViewController.photoViewControllerImageView.frame
        photoViewController.photoViewControllerImageView.frame = newsfeedViewController.selectedImageView.frame

        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            //toViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) //=======
            photoViewController.photoViewControllerImageView.frame = destinationImageFrame
            self.blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        }) { (finished: Bool) -> Void in
            newsfeedViewController.selectedImageView.isHidden = false
            photoViewController.photoViewControllerImageView.isHidden = false
            self.blackView.removeFromSuperview()
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        fromViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        fromViewController.view.alpha = 1
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            fromViewController.view.alpha = 0
        self.blackView.frame.origin = CGPoint(x: -self.blackView.frame.size.width, y: -self.blackView.frame.size.height)//
        }) { (finished: Bool) -> Void in
            
            
            self.finish()
        }
    }
}
