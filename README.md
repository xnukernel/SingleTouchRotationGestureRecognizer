# SingleTouchRotationGestureRecognizer
Custom Gesture Recognizer in Swift SpriteKit

**Credit**
This was implemented in SpriteKit following the tutorial and example code by @csgulley — [Creating a Gesture Recognizer in Swift](http://iosdevstuff.blogspot.com/2015/09/creating-gesture-recognizer-in-swift.html).

His repository of code is here: [Repo](https://github.com/csgulley/SingleTouchRotationGestureRecognizer)


# Single Touch Rotation Gesture Recognizer
This is a rotation gesture recognizer similar to UIRotationGestureRecognizer but it tracks a single touch as it rotates around the center of the view. You might use it to implement a knob-type control. It is implemented in Swift. You can read about its development at [Creating a Gesture Recognizer in Swift](http://iosdevstuff.blogspot.com/2015/09/creating-gesture-recognizer-in-swift.html).

## Usage

Copy SingleTouchRotationGestureRecognizer into your project. It behaves similarly to UIRotationGestureRecognizer. Example:

```
override func viewDidLoad() {
    super.viewDidLoad()
    recognizer = SingleTouchRotationGestureRecognizer(target: self, action: "rotated:")
    square.addGestureRecognizer(recognizer)
}

func rotated(sender: SingleTouchRotationGestureRecognizer) {
    print("rotation: \(sender.rotation)")
    print("velocity: \(sender.velocity)")
}
```

The rotation property indicates total rotation since the gesture began in radians. A positive value indicates clockwise rotation and a negative value indicates couterclockwise rotation.

The velocity property indicates the angular velocity in radians/second.


ViewController.swift has some sample code that uses the gesture recognizer to rotate a view in response to touch events.

## License

SingleTouchRotationGestureRecognizer is available under the MIT license. See the LICENSE file for more info.
