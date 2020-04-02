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
    
    init(radians: Float = .pi/2) {
        
        self.radians = radians
    }
    
    func rotate(_ imageView: UIImageView, direction: ImageRotator.Direction) {
        
        if let image = imageView.image {
            imageView.image = rotate(image, direction: direction)
        }
    }
    
    func rotate(_ image: UIImage, direction: ImageRotator.Direction) -> UIImage? {
        
        let radiansToRotate = self.radians * direction.rawValue
        
        let oldSizeAsRect = CGRect(origin: CGPoint.zero, size: image.size)
        var newSize = oldSizeAsRect.applying(CGAffineTransform(rotationAngle: CGFloat(radiansToRotate))).size
        
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        
        // Rotate around middle
        context.rotate(by: CGFloat(radiansToRotate))
        
        // Draw the image at its center
        let newOrigin = CGPoint(x: -image.size.width/2, y: -image.size.height/2)
        
        image.draw(in: CGRect(origin: newOrigin, size: image.size))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
