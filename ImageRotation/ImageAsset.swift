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
    
    case icon_rotate_clockwise_24px
    case icon_rotate_counterclockwise_24px
    
    func getImage() -> UIImage? {
        
        return UIImage(named: self.rawValue)
    }
}
