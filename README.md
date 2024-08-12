<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
[![Pub Version](https://img.shields.io/pub/v/picture_button?color=blue)](https://pub.dev/packages/picture_button)

PictureButton is setting only Image(ImageProvider type) and onPressed. like ButtonStyle. <br/>
I am very happy that I somehow seem to have deployed a useful widget.

<br/>

## Features 🍜

<img src="https://github.com/user-attachments/assets/345ed222-5e38-4149-ab01-5905fa0c12f2" alt="GIF" width="320">

<br/>
<br/>

## Getting started 🌱

my example image(google sign image) <br/>
path : `[project]/assets/` <br/> <br/>
<img src="https://github.com/user-attachments/assets/1c70006a-ee4c-4da3-9f58-b99d15865169" alt="Screenshot" width="480">

<br/>

 grant assets path from pubspec.yaml <br/>
 path : `[project]/pubspec.yaml` <br/> 
 ```yaml
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  assets:
    - assets/
```

#### add
```text
flutter pub add picture_button
```

#### import
```dart
import 'package:picture_button/picture_button.dart';
```

<br/>
<br/>

## Update 🍭

add `imagePressed` parameter from `0.0.8` version. <br/>
you can see the pressed image when you implement `onPressed` event.

<img src="https://github.com/user-attachments/assets/55ddb2bb-6584-43e0-be9c-deedeb7ccd75" alt="GIF" width="150" />


```dart
 PictureButton(
   onPressed: () {
   },
   image: Image.asset("assets/icon_flutter_default.png").image,
   imagePressed: Image.asset("assets/icon_flutter_pressed.png").image,
   ...
 )
```

<br/>

## Usage 🚀

| parameter       | required            | type                 | default                    |
|-----------------|---------------------|----------------------|----------------------------|
| onPressed       | :heavy_check_mark:  | VoidCallback         |                            |
| onLongPressed   | :x:                 | VoidCallback?        |                            |
| image           | :heavy_check_mark:  | ImageProvider        |                            |
| imagePressed    | :x:                 | ImageProvider?       |                            |
| width           | :x:                 | double?              | imageWidth                 |
| height          | :x:                 | double?              | imageHeight                |
| fit             | :x:                 | BoxFit               | BoxFit.contain             |
| margin          | :x:                 | EdgeInsets?          |                            |
| opacity         | :x:                 | double               | 1.0                        |
| border          | :x:                 | Border?              |                            |
| borderRadius    | :x:                 | BorderRadius?        |                            |
| borderRadiusInk | :x:                 | BorderRadius?        |                            |
| paddingInk      | :x:                 | EdgeInsetGeometry    | EdgeInsets.zero            |
| backgroundColor | :x:                 | Color?               |                            |
| splashColor     | :x:                 | Color?               |                            |
| highlightColor  | :x:                 | Color?               |                            |
| focusColor      | :x:                 | Color?               |                            |
| hoverColor      | :x:                 | Color?               |                            |
| enabled         | :x:                 | bool                 | true                       |
| useBubbleEffect | :x:                 | bool                 | false                      |
| bubbleEffect    | :x:                 | PictureBubbleEffect? | PictureBubbleEffect.shrink | 
| child           | :x:                 | Widget?              |                            |

<br/>

#### 👨‍👩‍👧‍👦 AssetImage(..), NetworkImage(..), FileImage(..), MemoryImage(..)

```dart
 PictureButton(
   onPressed: () {
     
   },
   image: const AssetImage("assets/google_sign_image.png"),
 ),
```
<br/>

#### 👨‍👨‍👧‍👦 Image.asset(..), Image.network(..), Image.file(..), Image.memory(..)
use later `.image` getter function.


```dart
 PictureButton(
   onPressed: () {
     
   },
   image: Image.asset("assets/google_sign_image.png").image,
 ),
```
<br/>

#### 🛀 Bubble Effect
`useBubbleEffect: true`
```dart
 PictureButton(
   onPressed: () {
     
   },
   image: Image.asset("assets/google_sign_image.png").image,
   useBubbleEffect: true,
   bubbleEffect: PictureBubbleEffect.shrink, // [shrink, expand]
 ),
```

<br/>

#### 🖌 if you don't want Effect(Ripple) Color (I said 'Ink')
`splashColor: Colors.transparent` <br/>
`highlightColor: Colors.transparent` <br/>
```dart
 PictureButton(
   onPressed: () {
     
   },
   image: Image.asset("assets/google_sign_image.png").image,
   highlightColor: Colors.transparent,
   splashColor: Colors.transparent,
 ),
```

<br/>

#### ✂ measure Effect(Ripple) BorderRadius
`borderRadiusInk: BorderRadius.circular(8.0)`
```dart
 PictureButton(
   onPressed: () {
     
   },
   image: Image.asset("assets/google_sign_image.png").image,
   borderRadiusInk: BorderRadius.circular(8.0),
   // paddingInk: EdgeInsets.all(8.0),   if you want measure 'Ink' padding.
 ),
```
