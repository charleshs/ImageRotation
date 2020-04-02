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
    
    private let rotator = ImageRotator(radians: .pi/2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
    }
    
    @IBAction func rotateClockwise(_ sender: UIButton) {
        
        rotator.rotate(imageView, direction: .clockwise)
    }
    @IBAction func rotateCounterclockwise(_ sender: Any) {
        
        rotator.rotate(imageView, direction: .counterclockwise)
    }
    
    private func setupImageView() {
        
        imageView.image = ImageAsset.scenary.getImage()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }
}

