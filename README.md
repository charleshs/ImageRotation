# ImageRotation

A module created for Swift language to deal with rotation of an image.

## Usage

Use `RotatableImage` to hold an UIImage and to provide rotation functionalities.

### Initialization

```swift
// Initialize an object of RotatableImage, passing in an UIImage as an argument.
let rotatableImage = RotatableImage(image)
```

### Rotating the image

Rotate the image by an angle via `rotate(by:direction:)` and access the result through `image` property.

```swift
rotatableImage.rotate(by: Double.pi / 2, direction: .clockwise)
imageView.image = rotatableImage.image
```

Alternatively, you could use `rotated(by:direction:)` to rotate the image and return it at once.

```swift
imageView.image = rotatableImage.rotated(by: Double.pi / 2, direction: .counterclockwise)
```

If you want to rotate the image to a certain angle, no matter what orientation it currently has,
you could use `rotate(to:)` method to do that. Note that positive/negative radians should be considered
in terms of the direction of the rotation.

```swift
rotatableImage.rotate(to: -Double.pi / 3)
imageView.image = rotatableImage.rotated(to: -Double.pi / 3)
```

### Getting the original image

Getting the original image without rotation can be done by calling `getOriginalImage()`

```swift
let originalImage = rotatableImage.getOriginalImage() 
```

### Reset the rotation

To reset the rotation of an image, you could use `rotateToOriginal` or `rotatedAsOriginal()`. 
The latter returns the outcome.

```swift
rotatableImage.rotateToOriginal()
imageView.image = rotatableImage.rotatedAsOriginal()
```
