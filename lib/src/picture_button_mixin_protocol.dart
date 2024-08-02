import 'package:flutter/material.dart';
import './picture_button.dart';

mixin PictureButtonMixinProtocol on State<PictureButton> {
  /// ui.Image's data
  ///
  /// how import?
  ///   import 'dart:ui' as ui;
  ///
  /// this function will get to your Image real(pixel) size.
  /// ex) google_sign_image.png 537x132
  Future<void> loadImageInfo() =>
      throw UnimplementedError("loadImageInfo has not been implemented");

  /// calculate Display size
  ///
  /// if Image fit contain or fill or cover ~ etc.
  /// this function will get Image's display size.
  Size calculateImageDisplaySize(BoxConstraints constraints) =>
      throw UnimplementedError(
          "calculateImageDisplaySize has not been implemented");

  /// [imageWidth] is finally display Image's [width] size.
  double? get imageWidth =>
      throw UnimplementedError("imageWidth has not been implemented");

  /// [imageHeight] is finally display Image's [height] size.
  double? get imageHeight =>
      throw UnimplementedError("imageHeight has not been implemented");
}
