//
//  HomeNavControllerDelegate.swift
//  QApp
//
//  Created by Anuraag Jain on 10/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class HomeNavControllerDelegate: NSObject,UINavigationControllerDelegate {
    let interactionController:UIPercentDrivenInteractiveTransition? = nil
    @IBOutlet weak var navigationController:UINavigationController!
    var animator = Animator()
    
    override func awakeFromNib() {
        interactionController?.completionSpeed = 1.0
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactionController
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push{
            animator.isPresenting = true
            return self.animator
        }
        animator.isPresenting = false
        return self.animator
    }
    
}
