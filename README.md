# RotateImage

A module created for Swift language to deal with rotation of an image.

## Usage

### Return a rotated UIImage

```swift
let rotator = ImageRotator(radians: Float.pi / 2)
let rotatedImage = rotator.rotate(image, direction: .clockwise)
```

### Rotate the image of a UIImageView

```swift
let rotator = ImageRotator(radians: Float.pi / 2)
rotator.rotate(imageView, direction: .counterclockwise)
```
