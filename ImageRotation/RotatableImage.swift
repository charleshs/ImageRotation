//
//  ImageRotator.swift
//  ImageRotation
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import UIKit

enum ImageRotationError: Error {
    
    case getCurrentContextError
}

public class RotatableImage {
    
    public enum Direction: Double {
        
        case clockwise = 1.0
        
        case counterclockwise = -1.0
    }
    
    public var image: UIImage? {
        return rotatedImage
    }
    
    private let originalImage: UIImage
    
    private var rotatedImage: UIImage?

    private var rotatedRadians: Double = 0.0
    
    public init(_ image: UIImage) {
        
        self.originalImage = image
    }

    public func rotatedAsOriginal() -> UIImage {
        
        rotatedRadians = 0
        rotatedImage = nil
        return originalImage
    }

    public func rotate(by radians: Double, direction: RotatableImage.Direction) {
        
        rotateViaCGImage(by: radians, direction: direction)
    }
    
    public func rotated(by radians: Double, direction: RotatableImage.Direction) -> UIImage? {
        
        rotateViaCGImage(by: radians, direction: direction)
        return rotatedImage
    }
    
    private func rotateViaCGImage(by radians: Double, direction: RotatableImage.Direction) {
                
        let radiansToRotate = CGFloat(rotatedRadians + radians * direction.rawValue)
        
        if radiansToRotate.truncatingRemainder(dividingBy: .pi * 2) == 0 {
            rotatedRadians = Double(radiansToRotate)
            rotatedImage = originalImage
            return
        }
        
        let rotatedRect = getRotatedRect(for: originalImage, by: radiansToRotate)
        
        do {
            let newImage = try getImageFromContext(rect: rotatedRect, toAngle: radiansToRotate)
            rotatedRadians = Double(radiansToRotate)
            rotatedImage = newImage
            
        } catch {
            debugPrint("Unresolved error: \(error)")
        }
    }
    
    private func getImageFromContext(rect: CGRect, toAngle radians: CGFloat) throws -> UIImage? {
        
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            throw ImageRotationError.getCurrentContextError
        }
        
        context.translateBy(x: rect.width / 2, y: rect.height / 2)
        context.rotate(by: radians)
        context.translateBy(x: -originalImage.size.width / 2, y: -originalImage.size.height / 2)
        
        originalImage.draw(at: .zero)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    private func getRotatedRect(for image: UIImage, by radians: CGFloat) -> CGRect {
        
        let imageRect = CGRect(origin: .zero, size: image.size)
        let rotatedTransform = CGAffineTransform(rotationAngle: radians)
        var rotatedRect = imageRect.applying(rotatedTransform)
        
        rotatedRect.origin = .zero
        rotatedRect.size.width = floor(rotatedRect.size.width)
        rotatedRect.size.height = floor(rotatedRect.size.height)
        
        return rotatedRect
    }
}
