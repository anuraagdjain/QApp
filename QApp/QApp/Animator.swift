//
//  Animator.swift
//  QApp
//
//  Created by Anuraag Jain on 10/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class Animator:NSObject,UIViewControllerAnimatedTransitioning{
    var isPresenting = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController: UIViewController? = transitionContext.viewController(forKey: .to)
        let fromViewController: UIViewController? = transitionContext.viewController(forKey: .from)
        transitionContext.containerView.addSubview((toViewController?.view)!)
        toViewController?.view?.alpha = 0
        
        if isPresenting{
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {() -> Void in
            fromViewController?.view?.transform = CGAffineTransform(translationX: 1.02, y: 1.02)
            toViewController?.view?.alpha = 1
        }, completion: {(_ finished: Bool) -> Void in
            fromViewController?.view?.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
        }else{
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {() -> Void in
                fromViewController?.view?.transform = CGAffineTransform(translationX: 1.02, y: 1.02)
                toViewController?.view?.alpha = 1
            }, completion: {(_ finished: Bool) -> Void in
                fromViewController?.view?.transform = CGAffineTransform.identity
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
    
}
