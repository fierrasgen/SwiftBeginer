//
//  CustomAvatar.swift
//  Social App
//
//  Created by Alexander Novikov on 13.10.2020.
//

import Foundation
import UIKit

@IBDesignable class CustomAvatar: UIView {
    
    @IBInspectable var size: CGFloat = 8 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var opacity: Float = 0.8 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    
    override func draw (_ rect: CGRect ) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .red
        view.layer.cornerRadius = 25
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = size
        view.layer.shadowOpacity = opacity
        
       
        
        self.addSubview(view)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
        self.addSubview(imageView)
    }

}
