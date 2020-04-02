//
//  ImageAsset.swift
//  ImageRotation
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import UIKit

enum ImageAsset: String {
    
    case scenary
    
    func getImage() -> UIImage? {
        
        return UIImage(named: self.rawValue)
    }
}
