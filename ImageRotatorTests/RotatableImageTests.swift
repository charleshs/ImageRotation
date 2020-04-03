//
//  RotatableImageTests.swift
//  RotatableImageTests
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import XCTest
@testable import ImageRotation

class RotatableImageTests: XCTestCase {
    
    var sut: RotatableImage!
    
    var image: UIImage {
        
        return ImageAsset.scenary.getImage()!
    }
    
    override func setUpWithError() throws {
        
        sut = RotatableImage(image)
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
    }
    
    func test_rotate() throws {
        
        let expectedSize = CGSize(width: image.size.height, height: image.size.width)
        
        sut.rotate(by: .pi / 2, direction: .clockwise)
        
        guard let rotatedImage = sut.image else {
            XCTFail("Failed to rotate image.")
            return
        }
        
        var outputSize = rotatedImage.size
        XCTAssertEqual(outputSize, expectedSize)
        
        sut.rotate(by: .pi, direction: .counterclockwise)
        
        guard let rotatedImage2 = sut.image else {
            XCTFail("Failed to rotate image.")
            return
        }
        
        outputSize = rotatedImage2.size
        XCTAssertEqual(outputSize, expectedSize)
    }
    
    func test_rotated() throws {
        
        let expectedSize = CGSize(width: image.size.height, height: image.size.width)
        
        guard let rotatedImage = sut.rotated(by: .pi / 2, direction: .clockwise) else {
            XCTFail("Failed to rotate image.")
            return
        }
        
        var outputSize = rotatedImage.size
        XCTAssertEqual(outputSize, expectedSize)
        
        guard let rotatedImage2 = sut.rotated(by: .pi, direction: .counterclockwise) else {
            XCTFail("Failed to rotate image.")
            return
        }
        
        outputSize = rotatedImage2.size
        XCTAssertEqual(outputSize, expectedSize)
    }
}
