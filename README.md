# ImageRotation

A module created for Swift language to deal with rotation of an image.

## Usage

Use RotatableImage to hold an UIImage and to provide rotation functionalities.

### Initialization

```swift
// Initialize an object of RotatableImage, passing in an UIImage as an argument.
let rotatableImage = RotatableImage(image)
```

### Rotating the image

```swift
// Rotate the image by an angle, and access it by `image` property that holds the current rotation of the original image.
rotatableImage.rotate(by: Double.pi / 2, direction: .clockwise)
imageView.image = rotatableImage?.image

// Rotate and return altogether
imageView.image = rotatableImage.rotated(by: Double.pi / 2, direction: .counterclockwise)

// Rotate the image to a certain orientation (need to consider the signed symbol for direction).
rotatableImage.rotate(to: -Double.pi / 3)
imageView.image = rotatableImage.rotated(to: -Double.pi / 3)
```

### Getting the original image

```swift
// Returns the orignal image without changing the current rotating state.
let originalImage = rotatableImage.getOriginalImage() 
```

### Reset the rotation

```swift
rotatableImage.rotateToOriginal()
imageView.image = rotatableImage.rotatedAsOriginal()
```
