# AlertViewWrapper

The purpose of the project is to show how to implemet a wrapper for the [UIAlertController](https://developer.apple.com/documentation/uikit/uialertcontroller) which separates the place where alert is being shown from the place where it was decided to present an alert.

The project utilizes [VIPER](https://www.objc.io/issues/13-architecture/viper/) architecture as it shows clear separation between layer and divides responsibilities.  

During implementataion it was decided to change signature of the showAlert method and remove input parametr which gets a ViewController which supposed to be responsible for AlertController presentation.

The signature of the **showAlert** method is defined by **AlertPresentable** protocol.

```
protocol AlertPresentable {

	func showAlert(title: String?, message: String?, actions:[UIAlertAction], completion: (() -> Void)?)
}
```

In order to make the **AlertWrapper** decoupled from a View, where message should be presented, it was desided to communicate with UI via AlertPresentable protocol. A ViewController object conforming to AlertPresentable protocol passes to AlertWrapper as dependency during intialization. 