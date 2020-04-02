//
//  ImageRotator.swift
//  ImageRotation
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import UIKit

struct ImageRotator {
    
    enum Direction: Float {
        
        case clockwise = 1.0
        case counterclockwise = -1.0
    }
    
    private let radians: Float
    
    init(radians: Float = .pi/2, direction: ImageRotator.Direction = .clockwise) {
        
        self.radians = radians * direction.rawValue
    }
    
    func rotate(_ image: UIImage) -> UIImage? {
        
        let oldFrame = CGRect(origin: CGPoint.zero, size: image.size)
        print(oldFrame)
        
        let newFrame = oldFrame.applying(CGAffineTransform(rotationAngle: CGFloat(self.radians)))
        print(newFrame)
        
        let newSize = newFrame.size
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        let newOrigin = CGPoint(x: -image.size.width/2, y: -image.size.height/2)
        image.draw(in: CGRect(origin: newOrigin, size: image.size))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
