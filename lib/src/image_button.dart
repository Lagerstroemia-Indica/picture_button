import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImageButton extends StatefulWidget {
  const ImageButton({
    super.key,
    required this.onPressed,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.splashColor,

    this.bubbleEffect = false,

    this.child
  });

  /// like onTap event.
  ///
  /// [onPressed] function is VoidCallback type.
  final VoidCallback onPressed;
  /// ImageProvider type
  /// you should ImageProvider,
  ///
  /// if you maybe use only
  /// Image.asset, Image.network, Image.memory, Image.file,
  /// do not built ImageButton Widget.
  ///
  /// their use 'image' property that is return ImageProvider type
  /// ex) final image = Image.network("https://bit.ly/example_image_12345").image
  ///     ImageButton(
  ///       onPressed: () {
  ///       },
  ///       image: image,
  ///     )
  /// -
  ///
  /// asset image : AssetImage([[IMAGE_PATH]])
  /// network image :NetworkImage([[IMAGE_PATH]])
  /// file image : FileImage([[IMAGE_PATH]])
  /// memory(Uint8List - from. typed_data.dart) image : MemoryImage([[Uint8List bytes]])
  final ImageProvider image;
  /// setting Image [width]
  /// type double
  ///
  /// if [width] is not defined, ImageProvider will find Size itself.
  final double? width;
  /// setting Image [height]
  /// type double
  ///
  /// if [height] is not defined, ImageProvider will find Size itself.
  final double? height;
  /// Image BoxFit
  ///
  /// default BoxFit.contain
  final BoxFit fit;

  final Color? splashColor;
  /// if you onPressed Event ImageButton Widget,
  /// Widget show you bubble effect.
  ///
  /// [bubbleEffect] default is 'false'
  final bool bubbleEffect;


  /// User defined Widget on ImageButton.
  final Widget? child;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  ui.Image? imageInfo;

  /// BoxFit.contain image display width size
  double? imageDisplayWidth;
  /// BoxFit.contain image display height size
  double? imageDisplayHeight;

  @override
  void initState() {
    super.initState();

    loadImageInfo();
  }

  /// if image fit is BoxFit.cover, BoxFit.fill,
  /// then imageInfo size not check.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (imageInfo != null) {
          final Size displaySize = calculateImageDisplaySize(constraints);
          imageDisplayWidth = displaySize.width;
          imageDisplayHeight = displaySize.height;
        }
        return Container(
          constraints: constraints,
          // width: width ?? constraints.maxWidth,
          // height: height ?? constraints.maxHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.image,
              fit: widget.fit
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              splashColor: widget.splashColor,
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: widget.width ?? (widget.fit != BoxFit.contain ? imageInfo?.width.toDouble() : imageDisplayWidth),
                height: widget.height ?? (widget.fit != BoxFit.contain ? imageInfo?.height.toDouble() : imageDisplayHeight),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
  late final ImageStream imageStream;
  late final ImageStreamListener imageStreamListener;

  Future<void> loadImageInfo() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      imageStream = widget.image.resolve(ImageConfiguration.empty);
      imageStreamListener = ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
        setState(() {
          this.imageInfo = imageInfo.image;
          debugPrint("imageInfo width:${this.imageInfo!.width}");
          debugPrint("imageInfo height:${this.imageInfo!.height}");
        });

        imageStream.removeListener(imageStreamListener);
      });

      imageStream.addListener(imageStreamListener);
    });
  }

  Size calculateImageDisplaySize(BoxConstraints constraints) {
    assert(imageInfo != null, "imageInfo instance has not create.");

    final double widthRatio = constraints.maxWidth / imageInfo!.width;
    final double heightRatio = constraints.maxHeight / imageInfo!.height;
    final double scale = widthRatio < heightRatio ? widthRatio : heightRatio;

    return Size(
      imageInfo!.width * scale,
      imageInfo!.height * scale
    );
  }
}
