//
//  PhotoAnimationViewController.swift
//  Social App
//
//  Created by Alexander Novikov on 27.10.2020.
//

import UIKit

class PhotoAnimationViewController: UIViewController {

    let images = (11...14)
        .map { String($0) }
        .compactMap { UIImage(named: $0) }
    
    var currentIndex = 0
    
    var animator: UIViewPropertyAnimator!
    
    enum Direction {
        case left, right
        
        init(x: CGFloat) {
            self = x > 0 ? .right : .left
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    lazy var nextImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = images.first
        nextImageView.contentMode = .scaleAspectFit
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(pan)
    }

    @objc func onPan(_ sender: UIPanGestureRecognizer) {
        guard let panView = sender.view else { return }
        
        let translation = sender.translation(in: panView)
        print(translation.x)
        let direction = Direction(x: translation.x)
        print(direction)
        
        switch sender.state {
        
        case .began:
//            print("began")
            animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
                self.imageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.imageView.alpha = 0
            })
            
            if canSlide(direction) {
                let nextIndex = direction == .left ? currentIndex + 1 : currentIndex - 1
                nextImageView.image = images[nextIndex]
                view.addSubview(nextImageView)
                let offsetX = direction == .left ? view.bounds.width : -view.bounds.width
                nextImageView.frame = view.bounds.offsetBy(dx: offsetX, dy: 0)
                
                animator.addAnimations({
                    self.nextImageView.center = self.imageView.center
                    self.nextImageView.alpha = 1
                }, delayFactor: 0.15)
            }
            
            animator.addCompletion { (position) in
                guard position == .end else { return }
                self.currentIndex = direction == .left ? self.currentIndex + 1 : self.currentIndex - 1
                self.imageView.alpha = 1
                self.imageView.transform = .identity
                self.imageView.image = self.images[self.currentIndex]
                self.nextImageView.removeFromSuperview()
            }
            animator.pauseAnimation()
            
        case .changed:
//            print("changed")
            animator.fractionComplete = abs(translation.x) / panView.frame.width
            
        case .ended:
//            print("ended")
            if canSlide(direction), animator.fractionComplete > 0.6 {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            } else {
                animator.stopAnimation(true)
                UIView.animate(withDuration: 0.25) {
                    self.imageView.transform = .identity
                    self.imageView.alpha = 1
                    let offsetX = direction == .left ? self.view.bounds.width : -self.view.bounds.width
                    self.nextImageView.frame = self.view.bounds.offsetBy(dx: offsetX, dy: 0)
                }
            }
            
        default:
            break
        }
    }
    
    func canSlide(_ direction: Direction) -> Bool {
        if direction == .left {
            return currentIndex < images.count - 1
        } else {
            return currentIndex > 0
        }
    }


}
