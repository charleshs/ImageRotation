//
//  ImageRotatorTests.swift
//  ImageRotatorTests
//
//  Created by Charles Hsieh on 2020/4/2.
//  Copyright © 2020 Charles Hsieh. All rights reserved.
//

import XCTest
@testable import ImageRotation

class ImageRotatorTests: XCTestCase {
    
    var sut: ImageRotator!
    
    override func setUpWithError() throws {
        
        sut = ImageRotator(radians: .pi/2)
    }

    override func tearDownWithError() throws {
        
        sut = nil
    }

    func testRotateClockwise() throws {
        
        guard let image = ImageAsset.scenary.getImage() else {
            XCTFail("Failed to load image.")
            return
        }
        guard let rotatedImage = sut.rotate(image, direction: .clockwise) else {
            XCTFail("Failed to rotate image.")
            return
        }
        let expectedSize = CGSize(width: image.size.height, height: image.size.width)
        let outputSize = rotatedImage.size
        
        XCTAssertEqual(outputSize, expectedSize)
    }
    
    func testRotateCounterclockwise() throws {
        
        guard let image = ImageAsset.scenary.getImage() else {
            XCTFail("Failed to load image.")
            return
        }
        guard let rotatedImage = sut.rotate(image, direction: .counterclockwise) else {
            XCTFail("Failed to rotate image.")
            return
        }
        let expectedSize = CGSize(width: image.size.height, height: image.size.width)
        let outputSize = rotatedImage.size
        
        XCTAssertEqual(outputSize, expectedSize)
    }
}
