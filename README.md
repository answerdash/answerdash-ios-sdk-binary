# AnswerDash iOS SDK

This repository contains binary distribution of AnswerDash iOS SDK released by [AnswerDash](http://www.answerdash.com).

If you have any questions, comments, or issues related to any products distributed via this repository then please contact the team by emailing [support@answerdash.com](mailto:support@answerdash.com).

## Requirements

AnswerDashSDK is a dynamic framework that is compatible with Objective-C and Swift projects that target **iOS 8** and higher.
<br/>
<br/>

## Installation

AnswerDashSDK can be installed directly into your application by importing the framework or via CocoaPods. Quick installation instructions are provided below for reference.

### CocoaPods Installation

The recommended path for installation is [CocoaPods](http://cocoapods.org/). CocoaPods provides a simple, versioned dependency management system that automates the tedious and error prone aspects of manually configuring libraries and frameworks. You can add AnswerDashSDK to your project via CocoaPods by doing the following:

```sh
$ sudo gem install cocoapods
$ pod setup
```

Now run the following in the root of your project directory:

```sh
$ pod init
```

This creates a `Podfile`, to integrate the AnswerDashSDK add `pod AnswerDashSDK` to the file. It should now look similar to this: 

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AnswerDashSDK'
end
```

Complete the installation by executing:

```sh
$ pod install
```

These instructions will setup your local CocoaPods environment and import AnswerDashSDK into your project.

### Manual Framework Installation

If you wish to install AnswerDashSDK directly into your application via the binary framework, [download the latest `AnswerDashSDK.tgz`](https://repo.answerdash.com/releases/com/answerdash/ios/), extract `AnswerDashSDK.framework` and add it to your application with the following steps:

1. Drag and drop the framework onto your project, instructing Xcode to copy items into your destination group's folder.
2. In your project settings, make sure `AnswerDashSDK.framework` is added to both 'Linked Frameworks and Libraries' and 'Embedded Binaries'.

#### Important Note:
Apple will not allow uploading apps with unwanted architectures. You will see an error similar to this:
```diff
- ERROR ITMS-90087: "Unsupported Architectures. The executable for YourCompany.app/Frameworks/AnswerDashSDK.framework contains unsupported architectures '[x86_64, i386]'."
```
![ITMS-90087: AnswerDashSDK.framework contains unsupported architectures '[x86_64, i386]'](https://s3-us-west-2.amazonaws.com/answerdash-images-general/xcode_unsupported_architectures.png)

To fix this, **add Run Script Phase to Build Phases:**

1. Go to "Build Phase" section of your target settings.
2. Click on the + button in the top left and select "New Run Script Phase".
3. In the script text input box paste the following snippet:

`bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/AnswerDashSDK.framework/strip-frameworks.sh"`

![add Run Script Phase to Build Phases](https://s3-us-west-2.amazonaws.com/answerdash-images-general/run_script_strip_frameworks.png)

For more info, check [this article](http://ikennd.ac/blog/2015/02/stripping-unwanted-architectures-from-dynamic-libraries-in-xcode/).
<br/>
<br/>

## Usage

#### Importing the library
Swift:
```swift
@import AnswerDashSDK
```
Objective-C:
```objc
#import <AnswerDashSDK/AnswerDashSDK.h>
```
#### Initialization
AnswerDashSDK should be initialized at the application startup with a valid site ID. Add the following line to your `application:didFinishLaunchingWithOptions:` delegate method.

Swift:
```swift
AnswerDash.initialize(withSiteID: "YOUR-SITE-ID")
```
Objective-C:
```objc
[AnswerDash initializeWithSiteID:@"YOUR-SITE-ID"];
```

#### Setting App State
Whenever your application state changes, call the following method to inform the AnswerDashSDK. Calling this method will automatically preload the new questions and answers.

Swift:
```swift
AnswerDash.appState = "NEW-APP-STATE"
```
Objective-C:
```objc
[AnswerDash setAppState:@"NEW-APP-STATE"];
```

#### Adding AnswerDash Button
*Programatically*,

Swift:
```swift
let myAnswerDashButton = AnswerDashButton()
view.addSubview(myAnswerDashButton)
//Add layout constraints as required to position the button.
```
Objective C:
```objc
AnswerDashButton *myAnswerDashButton = [AnswerDashButton new];
[self.view addSubview:myAnswerDashButton];
//Add layout constraints as required to position the button.
```
*Using Interface Builder,*

Add a `UIView` to your interface XIB/Storyboard. Change the custom class to `AnswerDashButton` and add required layout constraints to position the button. *DO NOT* add width and height constraints.

#### Adding a floating AnswerDash button

If you need a default floating help button for your `UITableView`, `UICollectionView` or any other `UIScrollView` based control, use this convenient method. AnswerDashSDK will properly position the button on the bottom right corner of the view and make it sticky when scrolling.

Swift:
```swift
tableView.addAnswerDashButton()
```
Objective-C:
```objc
[self.tableView addAnswerDashButton];
```

You can call `removeAnswerDashButton` method to remove the button if required. For example:

Swift:
```swift
deinit {
    tableView.removeAnswerDashButton()
}
```
Objective-C:
```objc
- (void)dealloc {
    [self.tableView removeAnswerDashButton];
}
```

#### Styling

You can customize the appearance of the default AnswerDash button using following properties.

```
myAnswerDashButton.borderColor
myAnswerDashButton.fillColor
myAnswerDashButton.iconColor
```

#### Using your own button implementations

If you want to trigger the AnswerDash popup using your own button or other interaction, call methods below directly to show and hide the popup.

Swift:
```swift
AnswerDashSDK.show() //Opens the AnswerDash popup
AnswerDashSDK.hide() //Close the AnswerDash popup
```
Objective-C:
```objc
[AnswerDashSDK show]; //Opens the AnswerDash popup
[AnswerDashSDK hide]; //Close the AnswerDash popup
```
<br/>
<br/>

## Contact

You can reach the AnswerDash team at any time by emailing [support@answerdash.com](mailto:support@answerdash.com).
<br/>
<br/>

## License

AnswerDashSDK is licensed under the [AnswerDash SDK License](https://github.com/answerdash/answerdash-ios-sdk-binary/blob/master/LICENSE.md).
