//
//  RotatableImage.swift
//  RotatableImage
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import UIKit

public class RotatableImage {
    
    public enum Direction: Double {
        
        case clockwise = 1.0
        
        case counterclockwise = -1.0
    }
    
    public enum RotatableImageError: Error {
        
        case getCurrentContextError
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
    
    public func rotate(by radians: Double, direction: RotatableImage.Direction) {
        
        _rotate(by: radians, direction: direction)
    }
    
    public func rotated(by radians: Double, direction: RotatableImage.Direction) -> UIImage? {
        
        rotate(by: radians, direction: direction)
        return rotatedImage
    }
    
    public func rotate(to radians: Double) {
        
        _rotate(to: CGFloat(radians))
    }
    
    public func rotated(to radians: Double) -> UIImage? {
        
        rotate(to: radians)
        return rotatedImage
    }
    
    public func rotateToOriginal() {
        
        rotatedRadians = 0
        rotatedImage = originalImage
    }
    
    public func rotatedAsOriginal() -> UIImage? {
        
        rotateToOriginal()
        return rotatedImage
    }
    
    public func getOriginalImage() -> UIImage {
        
        return originalImage
    }
    
    private func _rotate(by radians: Double, direction: RotatableImage.Direction) {
        
        let finalRadians = CGFloat(rotatedRadians + radians * direction.rawValue)
        
        _rotate(to: finalRadians)
    }
    
    private func _rotate(to radians: CGFloat) {
        
        if radians.truncatingRemainder(dividingBy: .pi * 2) == 0 {
            rotatedRadians = Double(radians)
            rotatedImage = originalImage
            return
        }
        
        let rotatedRect = getRotatedRect(for: originalImage, by: radians)
        
        do {
            let newImage = try getImageFromContext(rect: rotatedRect, toAngle: radians)
            rotatedRadians = Double(radians)
            rotatedImage = newImage
            
        } catch {
            debugPrint("Unresolved error: \(error)")
        }
    }
    
    private func getImageFromContext(rect: CGRect, toAngle radians: CGFloat) throws -> UIImage? {
        
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            throw RotatableImageError.getCurrentContextError
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
