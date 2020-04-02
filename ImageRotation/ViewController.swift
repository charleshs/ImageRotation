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
    
    private let clockwiseRotator = ImageRotator(radians: .pi/2, direction: .clockwise)
    private let counterclockwiseRotator = ImageRotator(radians: .pi/2, direction: .counterclockwise)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
    }
    
    @IBAction func rotateClockwise(_ sender: UIButton) {
        
        if let image = imageView.image {
            let rotatedImage = clockwiseRotator.rotate(image)
            imageView.image = rotatedImage
        }
    }
    @IBAction func rotateCounterclockwise(_ sender: Any) {
        
        if let image = imageView.image {
            let rotatedImage = counterclockwiseRotator.rotate(image)
            imageView.image = rotatedImage
        }
    }
    
    private func setupImageView() {
        
        imageView.image = ImageAsset.scenary.getImage()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
}

