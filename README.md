# AnswerDash iOS SDK

This repository contains binary distribution of AnswerDash iOS SDK released by [AnswerDash](http://www.answerdash.com).

If you have any questions, comments, or issues related to any products distributed via this repository then please contact the team by emailing [thisguy@answerdash.com](mailto:support@answerdash.com).

## Requirements

AnswerDashSDK is a dynamic framework that is compatible with Objective-C and Swift projects that target **iOS 8** and higher.

## Installation

AnswerDashSDK can be installed directly into your application by importing the framework or via CocoaPods. Quick installation instructions are provided below for reference.

#### CocoaPods Installation

The recommended path for installation is [CocoaPods](http://cocoapods.org/). CocoaPods provides a simple, versioned dependency management system that automates the tedious and error prone aspects of manually configuring libraries and frameworks. You can add AnswerDashSDK to your project via CocoaPods by doing the following:

```sh
$ sudo gem install cocoapods
$ pod setup
```

Now create a `Podfile` in the root of your project directory and add the following:

```ruby
pod 'AnswerDashSDK'
```

Complete the installation by executing:

```sh
$ pod install
```

These instructions will setup your local CocoaPods environment and import AnswerDashSDK into your project.

#### Framework Installation

If you wish to install AnswerDashSDK directly into your application via the binary framework, Download `AnswerDashSDK.framework` from this repository and add it to your application:

1. Drag and drop the framework onto your project, instructing Xcode to copy items into your destination group's folder.
4. TODO: Add copy phase and strip frameworks details (check example at https://support.layer.com/hc/en-us/articles/204256740-Can-I-use-LayerKit-without-CocoaPods-)

## Usage
##### Importing the library
Swift:
```swift
@import AnswerDashSDK
```
Objective-C:
```objc
#import <AnswerDashSDK/AnswerDashSDK.h>
```
##### Initialization
AnswerDashSDK should be initialized at the application startup with a valid site ID. Add the following line to your `ApplicationDidFinishLaunchingWithOptions` delegate method.

Swift:
```swift
AnswerDash.initializeWithSiteID("YOUR-SITE-ID")
```
Objective-C:
```objc
[AnswerDash initializeWithSiteID:@"YOUR-SITE-ID"];
```

##### Setting App State
Whenever your application state changes, call the following method to inform the AnswerDashSDK. Calling this method will automatically preload the new questions and answers.

Swift:
```swift
AnswerDash.appState = "NEW-APP-STATE"
```
Objective-C:
```objc
[AnswerDash setAppState:@"NEW-APP-STATE"];
```

##### Adding AnswerDash Button
Programatically,

Swift:
```swift
let helpButton = AnswerDashButton()
view.addSubview(helpButton)
//Add layout constraint as required to position the button.
```
Objective C:
```objc
AnswerDashButton *helpButton = [AnswerDashButton new];
[view addSubview:helpButton];
//Add layout constraint as required to position the button.
```
Using Interface Builder,

Add a `UIView` to your interface XIB/Storyboard. Change the custom class to `AnswerDashButton` and add required layout constraints to position the button. *DO NOT* add width and height constraints.

##### Adding a floating AnswerDash button

If you need a default floating help button for your UITableView, UICollectionView or any other view UIScrollView based control, use this convenient method. AnswerDashSDK will properly position the button on the bottom right corner fo the view and make it sticky while scrolling.

Swift:
```swift
myTableView.addAnswerDashButton())
```
Objective-C:
```objc
[myTableView addAnswerDashButton];
```

## Contact

You can reach the Layer team at any time by emailing [support@answerdash.com](mailto:support@answerdash.com).

## License

AnswerDashSDK is licensed under the [AnswerDash SDK License](https://github.com/answerdash/releases-ios/LICENSE.md).