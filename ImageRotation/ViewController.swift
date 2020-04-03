//
//  ViewController.swift
//  ImageRotation
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    enum Angle {
        
        case halfQuarter
        case quarter
        case half
        
        var radians: Double {
            switch self {
            case .halfQuarter: return .pi / 4
            case .quarter: return .pi / 2
            case .half: return .pi
            }
        }
    }
    
    private let radiansToRotate = Angle.halfQuarter.radians

    private var rotatableImage: RotatableImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        
        if let image = imageView.image {
            rotatableImage = RotatableImage(image)
        }
    }
    
    @IBAction func rotateClockwise(_ sender: UIButton) {
        
        rotatableImage?.rotate(by: radiansToRotate, direction: .clockwise)
        imageView.image = rotatableImage?.image
    }
    @IBAction func rotateCounterclockwise(_ sender: Any) {
        
        imageView.image = rotatableImage?.rotated(by: radiansToRotate, direction: .counterclockwise)
    }
    
    @IBAction func rotateHalfCircle(_ sender: Any) {
        
        imageView.image = rotatableImage?.rotated(by: Angle.half.radians, direction: .clockwise)
    }
    
    @IBAction func resetImage(_ sender: Any) {
        
        imageView.image = rotatableImage?.rotatedAsOriginal()
    }
    
    private func setupImageView() {
        
        imageView.image = ImageAsset.scenary.getImage()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
}

