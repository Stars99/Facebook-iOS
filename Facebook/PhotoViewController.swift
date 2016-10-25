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
    
    
    
    //
    var photoViewControllerImageViewOrginalCenter: CGPoint!
    //
    
    
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
        let yScroll = scrollView.contentOffset.y
        
        
        if yScroll < -100 {
            dismiss(animated: true, completion: nil)
        } else {
            self.doneButton.isHidden = false
            self.photoAction.isHidden = false
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
        
        
    }
    
    
    
    @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
        
//            let translation = sender.translation(in: view)
//            
//            if sender.state == .began{
//                
//                
//                
//               photoViewControllerImageViewOrginalCenter = photoViewControllerImageView.center
//                
//                
//                UIView.animate(withDuration: 0.6, delay: 0.4, options: [] , animations: {
//                    
//                    self.photoViewControllerImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//                    //self.ryanImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
//                    
//                    
//                    
//                    
//                    }, completion: { (Bool) in
//                        
//                })
//                
//                
//                
//            } else if sender.state == .changed{
//                
//                
//                let rotationDegrees = convertValue(inputValue: translation.x, r1Min: 0, r1Max: 150, r2Min: 0, r2Max: 20)
//                self.photoViewControllerImageView.transform = CGAffineTransform(rotationAngleDegrees: rotationDegrees)
//                
//                
//                photoViewControllerImageView.center = CGPoint (x: photoViewControllerImageViewOrginalCenter.x + translation.x,y : photoViewControllerImageViewOrginalCenter.y + translation.y)
//                
//            } else if sender.state == .ended {
//                
//                UIView.animate(withDuration: 0.6, delay: 0.4, options: [] , animations: {
//                    //self.ryanImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//                    
//                    // self.ryanImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//                    //self.ryanImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
//                    
//                    }, completion: { (Bool) in
//                        
//                        //self.ryanImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
//                        //self.ryanImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//                        //  self.ryanImageView.transform = self.ryanImageView.transform.rotated(by: CGFloat(45 * M_PI / 180))
//                        
//                        
//                })
//            }
//        }
//        
//
        
        
    }
}
    
    
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

