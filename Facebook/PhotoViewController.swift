//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Poudel, Trilochan on 10/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
class PhotoViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollViewOfPhotoVC: UIScrollView!
    @IBOutlet weak var photoViewControllerImageView: UIImageView!
    @IBOutlet weak var photoAction: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var viewWithDoneButton: UIView!
    var image1 : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewOfPhotoVC.contentSize = CGSize(width: 375, height: 612)
        photoViewControllerImageView.image = image1
        //Register for the scroll
        scrollViewOfPhotoVC.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDoneButton(_ sender: UIButton) {
        self.doneButton.isHidden = true
        self.photoAction.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        self.doneButton.isHidden = true
        self.photoAction.isHidden = true
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.doneButton.isHidden = true
        self.photoAction.isHidden = true
        self.viewWithDoneButton.isHidden = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
        let Scroll = scrollView.contentOffset.y
        
        if Scroll < -50 {
            dismiss(animated: true, completion: nil)
        } else {
            self.doneButton.isHidden = false
            self.photoAction.isHidden = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrol
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoViewControllerImageView
    }

    
    
}

  
