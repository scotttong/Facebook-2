//
//  ImageTransition.swift
//  Facebook 2
//
//  Created by Scott Tong on 3/1/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
	
	var frame: CGRect!
	
	override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		/*
		var tabViewController = fromViewController as UITabBarController
		var feedNavViewController = tabViewController.viewControllers![0] as UINavigationController
		var feedViewController = feedNavViewController.topViewController as FeedViewController
		feedViewController.selectedImageView.hidden = true
		var photoViewController = toViewController as PhotoViewController
		photoViewController.bigImageContainer.hidden = true
		*/
		
		var tabViewController = fromViewController as UITabBarController
		var feedNavController = tabViewController.viewControllers![0] as UINavigationController
		var feedViewController = feedNavController.topViewController as FeedViewController
		feedViewController.selectedImageView.hidden = true
		
		var photoViewController = toViewController as PhotoViewController
		photoViewController.bigImageContainer.hidden = true
		
		var movingImageView = UIImageView()
		movingImageView.image = feedViewController.selectedImageView.image
//		movingImageView.frame = feedViewController.selectedImageView.frame
		movingImageView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds
		movingImageView.contentMode = feedViewController.selectedImageView.contentMode
		
		containerView.addSubview(movingImageView)
	
		frame = containerView.convertRect(feedViewController.selectedImageView.frame, fromView: feedViewController.feedScrollView)
		
		movingImageView.frame = frame
		
		
		toViewController.view.alpha = 0
		UIView.animateWithDuration(duration, animations: {
			
			movingImageView.frame = photoViewController.bigImageContainer.frame
			toViewController.view.alpha = 1
			}) { (finished: Bool) -> Void in
				self.finish()
		}
	}
	
	override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
		
		fromViewController.view.alpha = 1
		UIView.animateWithDuration(duration, animations: {
			fromViewController.view.alpha = 0
			}) { (finished: Bool) -> Void in
				self.finish()
		}
	}
	
	
}
