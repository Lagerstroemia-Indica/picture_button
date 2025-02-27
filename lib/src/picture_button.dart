import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picture_button/src/picture_bubble_effect.dart';
import './picture_button_mixin_protocol.dart';

class PictureButton extends StatefulWidget {
  /// thank you so much use this :)
  /// have good luck !
  /// when you need another things once write Github issue.
  ///
  /// -
  ///
  /// required parameters are [[onPressed]], [[image]].
  const PictureButton(
      {super.key,
      required this.onPressed,
      this.onLongPressed,
      this.onSelectChanged,
      required this.image,
      this.imagePressed,
      this.imageSelected,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.margin,
      this.opacity = 1.0,
      this.border,
      this.borderRadius,
      this.borderRadiusInk,
      this.paddingInk = EdgeInsets.zero,
      this.backgroundColor,
      this.splashColor,
      this.highlightColor,
      this.focusColor,
      this.hoverColor,
      this.enabled = true,
      this.vibrate = true,
      this.useBubbleEffect = false,
      this.bubbleEffect = PictureBubbleEffect.shrink,
      this.child})
      : assert(child is! Container, "Don't use widget child Container"),
        assert(
            (onSelectChanged != null) == (imageSelected != null),
            "Each properties define not null, \n"
            "When imageSelected is not null, \n"
            "onSelectChanged must not be null. \n"
            "so you can return PictureButton's selected state.\n"
            "this error resolve that must define "
            "[onSelectChanged] and [imageSelected] properties. \n"
            "like, (imageSelected == null && onSelectChanged == null) || (imageSelected != null && onSelectChanged != null)");

  /// like onTap event.
  ///
  /// [onPressed] function is VoidCallback type.
  final VoidCallback onPressed;

  /// [onLongPressed] function is VoidCallback type.
  ///
  /// it is not required.
  ///
  /// -
  ///
  /// default is 'null'
  final VoidCallback? onLongPressed;

  /// Certainly define [imageSelected] property.
  ///
  /// [onSelectChanged] function return PictureButton's current state.
  /// isSelected true or false.
  ///
  /// when you want PictureButton's selected state. define it.
  /// and [imageSelected].
  ///
  /// so you will be show it after tap event.
  final Function(bool isSelected)? onSelectChanged;

  /// ImageProvider type
  /// you should ImageProvider,
  ///
  /// if you maybe use only
  /// Image.asset, Image.network, Image.memory, Image.file,
  /// do not built ImageButton Widget.
  ///
  /// their use 'image' property that is return ImageProvider type
  /// ex) final image = Image.network("https://bit.ly/example_image_12345").image
  ///     PictureButton(
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

  /// [image] is default image.
  ///
  /// [imagePressed] is [onPressed] image.
  ///
  /// when you pressed PictureButton Widget.
  /// change toggle [image] and [imagePressed] images.
  final ImageProvider? imagePressed;

  /// [image] is default image.
  ///
  /// [imageSelected] is selected PictureButton's image.
  ///
  /// when you pressed and touch up this.
  /// change [image] to [imageSelected].
  ///
  /// isSelected = true, [imageSelected].
  ///
  /// isSelected = false, [image]
  ///
  ///
  ///
  /// Certainly you should define [onSelectChanged] function.
  /// [onSelectChanged] function returns PictureButton's current state.
  /// isSelected true or false.
  final ImageProvider? imageSelected;

  /// setting Image [width]
  /// type double
  ///
  /// -
  ///
  /// if [width] is not defined, ImageProvider will find Size itself.
  final double? width;

  /// setting Image [height]
  /// type double
  ///
  /// -
  ///
  /// if [height] is not defined, ImageProvider will find Size itself.
  final double? height;

  /// Image BoxFit
  ///
  /// default is BoxFit.contain
  final BoxFit fit;

  /// PictureButton's margin
  /// you should not add gap widget.
  ///
  /// [EdgeInsets] type
  ///
  /// ex) margin: EdgeInsets.all(8.0),
  ///
  /// -
  ///
  /// default is null
  final EdgeInsets? margin;

  /// ImageButton's measure opacity
  ///
  /// -
  ///
  /// default is 1.0
  ///
  /// -
  ///
  /// if you define [enabled] property return 'false'
  /// and do not define [opacity] return value '0.7'
  final double opacity;

  /// Box Border,
  /// setting Image's outlined Border
  ///
  /// -
  ///
  /// ex) Border.all(
  ///       color: Colors.black,
  ///       width: 3.0,
  ///     )
  ///
  /// -
  ///
  /// default is null
  final Border? border;

  /// Box Border Radius
  ///
  /// PictureButton Widget's BorderRadius
  /// default is BorderRadius.circular(8.0)
  final BorderRadius? borderRadius;

  /// when you [onPressed], [onLongPressed]
  /// setting this [borderRadiusInk]
  ///
  /// why am I define property name add 'Ink',
  /// once PictureButton Widget need two borderRadius.
  ///
  /// -
  ///
  /// first, [borderRadius] require Widget base border.
  /// second, [borderRadiusInl] require effect in Widget base border.
  final BorderRadius? borderRadiusInk;

  /// when you tapped[onPressed] that can you show Event splash, highlight.
  /// there area say 'Ink'
  ///
  /// this [paddingInk] define to there area.
  ///
  /// -
  ///
  /// default is [EdgeInsets.zero]
  final EdgeInsetsGeometry paddingInk;

  /// [imageBackgroundColor] behind [image] color.
  ///
  /// -
  ///
  /// maybe you define borderRadius or width, height.
  /// I recommend imageBackgroundColor Colors.transparent :)
  /// when exist only image, that is pretty.
  final Color? backgroundColor;

  /// [onPressed] onTap event color
  ///
  /// get ripple effect. touch event.
  final Color? splashColor;

  /// [onPressed] stay event color
  ///
  /// get stay touched event.
  final Color? highlightColor;

  /// if you hardware keyboard or another things.
  /// direction focusing Color event.
  final Color? focusColor;

  /// hover color is onFocused mouse point or pen pointer.
  ///
  /// -
  ///
  /// if you only touch hands, should not use this.
  /// but if you control others, should use this :)
  final Color? hoverColor;

  /// [PictureButton] define Enabled
  ///
  /// if enabled is 'false' don't use onPressed and change down tone color
  ///
  /// -
  ///
  /// default is 'true'
  final bool enabled;

  /// import 'package:flutter/services.dart';
  ///
  /// operate HapticFeedback.lightImpact();
  ///
  /// -
  ///
  /// default [vibrate] value is 'true'
  ///
  /// UPDATE: 30, Aug 2024. Version:0.0.10
  final bool vibrate;

  /// if you onPressed Event PictureButton Widget,
  /// Widget show you bubble effect.
  ///
  /// maybe if you don't want ink color.
  /// you set [highlightColor] property [Colors.transparent].
  /// and [splashColor] property [Colors.transparent].
  ///
  /// -
  ///
  /// [useBubbleEffect] default is 'false'
  final bool useBubbleEffect;

  /// [PictureBubbleEffect] shrink, expanded options.
  /// [shrink] is scale down 1.00 → 0.95
  ///
  /// [expanded] is scale up 1.00 → 1.05
  ///
  /// -
  ///
  /// default is [PictureBubbleEffect.shrink]
  final PictureBubbleEffect? bubbleEffect;

  /// User defined Widget on PictureButton.
  ///
  /// do not support [Container] widget.
  /// debug mode block it.
  final Widget? child;

  @override
  State<PictureButton> createState() => _PictureButtonState();
}

class _PictureButtonState extends State<PictureButton>
    with PictureButtonMixinProtocol {
  /// real image size
  ui.Image? imageInfo;

  /// purpose. check Image real size check
  late final ImageStream imageStream;

  ///
  late final ImageStreamListener imageStreamListener;

  /// BoxFit.contain image display width size
  double? imageDisplayWidth;

  /// BoxFit.contain image display height size
  double? imageDisplayHeight;

  /// AnimationScale Control scale size.
  ///
  /// control onTapUp, onTapDown functions.
  double animScale = 1.00;

  /// this [bubbleEffect] default value
  ///
  /// [PictureBubbleEffect.shrink] use this
  final double animScaleShrink = 0.95;

  /// [PictureBubbleEffect.expanded] use this
  final double animScaleExpand = 1.05;

  /// PictureButton Pressed state notify.
  bool isPressed = false;

  /// [isSelectedMode] check not null.
  /// to [widget.onSelectChanged] and [widget.imageSelected]
  late final bool isSelectedMode;

  /// PictureButton Selected state notify.
  ///
  /// check [isSelectedMode]
  /// connect [widget.onSelectChanged] and [widget.imageSelected]
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    isSelectedMode =
        widget.onSelectChanged != null && widget.imageSelected != null;

    loadImageInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// if image fit is BoxFit.cover, BoxFit.fill,
  /// then imageInfo size not check.
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: widget.enabled,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (imageInfo != null) {
            final Size displaySize = calculateImageDisplaySize(constraints);
            imageDisplayWidth = displaySize.width;
            imageDisplayHeight = displaySize.height;
          }

          return AnimatedScale(
            scale: animScale,
            curve: Curves.easeOutCubic,
            duration: const Duration(milliseconds: 100),
            child: Container(
              constraints: constraints,
              // width: width ?? constraints.maxWidth,
              // height: height ?? constraints.maxHeight,
              margin: widget.margin,
              padding: widget.paddingInk,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isSelectedMode
                      ? isPressed
                          ? widget.imagePressed ??
                              (isSelected
                                  ? widget.imageSelected!
                                  : widget.image)
                          : isSelected
                              ? widget.imageSelected!
                              : widget.image
                      : isPressed
                          ? widget.imagePressed ?? widget.image
                          : widget.image,
                  fit: widget.fit,
                  opacity: widget.opacity,
                ),
                color: widget.backgroundColor,
                border: widget.border,
                borderRadius: widget.borderRadius,
              ),
              child: Material(
                color: Colors.transparent,
                child: Builder(
                  builder: (context) {
                    final isRow =
                        context.findAncestorWidgetOfExactType<Row>() != null;
                    final isColumn =
                        context.findAncestorWidgetOfExactType<Column>() != null;

                    if (!isRow && !isColumn) {
                      return child;
                    } else {
                      return Flex(
                        direction: isRow ? Axis.horizontal : Axis.vertical,
                        children: [child],
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget get child => InkWell(
        onTap: widget.enabled ? widget.onPressed : null,
        onLongPress: widget.onLongPressed,
        onTapDown: (details) async {
          setState(() {
            if (widget.useBubbleEffect) {
              // animScale = 1.05;
              animScale = widget.bubbleEffect == PictureBubbleEffect.shrink
                  ? animScaleShrink
                  : animScaleExpand;
            }

            isPressed = true;
          });

          if (widget.vibrate) {
            await HapticFeedback.lightImpact();
          }
        },
        onTapUp: (details) {
          setState(() {
            if (widget.useBubbleEffect) {
              animScale = 1.00;
            }

            if (isSelectedMode) {
              isSelected = !isSelected;
              widget.onSelectChanged!(isSelected);
            }

            isPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            if (widget.useBubbleEffect) {
              animScale = 1.00;
            }

            isPressed = false;
          });
        },
        splashColor: widget.splashColor,
        highlightColor: widget.highlightColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        borderRadius: widget.borderRadiusInk ?? widget.borderRadius,
        enableFeedback: widget.enabled,
        child: SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: widget.child,
        ),
      );

  /// ImageProvider's real sizes.
  ///
  /// example) assets/google_sign_image.png : 567x132
  @override
  Future<void> loadImageInfo() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      imageStream = widget.image.resolve(ImageConfiguration.empty);
      imageStreamListener =
          ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
        setState(() {
          this.imageInfo = imageInfo.image;
          // if you want Log resolve this annotation :)
          // debugPrint("[---REAL IMAGE SIZE ---]");
          // debugPrint("imageInfo width:${this.imageInfo!.width}");
          // debugPrint("imageInfo height:${this.imageInfo!.height}");
          // debugPrint("[------------------ ---]");
        });

        imageStream.removeListener(imageStreamListener);
      });

      imageStream.addListener(imageStreamListener);
    });
  }

  /// calculate image ratio to displaySize.
  ///
  /// if you do not define width, height.
  /// this function get image's display size.
  ///
  /// BoxFit.contain, BoxFit.fitWidth, BoxFit.fitHeight
  @override
  Size calculateImageDisplaySize(BoxConstraints constraints) {
    assert(imageInfo != null, "imageInfo instance has not create.");

    late final double widgetWidth;
    late final double widgetHeight;

    /// if widget.width exist
    /// compare imageInfo.width
    ///
    /// if widget.width is smaller than constraints.maxWidth
    /// choice widget.width
    if (widget.width != null) {
      widgetWidth = widget.width! <= constraints.maxWidth
          ? widget.width!
          : constraints.maxWidth;
    } else {
      widgetWidth = constraints.maxWidth <= imageInfo!.width.toDouble()
          ? constraints.maxWidth
          : imageInfo!.width.toDouble();
    }

    /// if widget.height exist
    /// compare imageInfo.height
    ///
    /// if widget.width is smaller than constraints.maxHeight
    /// choice widget.height
    if (widget.height != null) {
      widgetHeight = widget.height! <= constraints.maxHeight
          ? widget.height!
          : constraints.maxHeight;
    } else {
      widgetHeight = constraints.maxHeight <= imageInfo!.height.toDouble()
          ? constraints.maxHeight
          : imageInfo!.height.toDouble();
    }

    final double widthRatio = widgetWidth / imageInfo!.width.toDouble();
    final double heightRatio = widgetHeight / imageInfo!.height.toDouble();

    // if you want Log resolve this annotation :)
    // debugPrint("constraint maxWidth:${constraints.maxWidth}");
    // debugPrint("constraint maxHeight:${constraints.maxHeight}");
    // debugPrint("calculate widgetWidth:$widgetWidth");
    // debugPrint("calculate widgetHeight:$widgetHeight");
    // debugPrint("-------------------------------------");
    // debugPrint("widthRatio:$widthRatio");
    // debugPrint("heightRatio:$heightRatio");
    // debugPrint("-------------------------------------");
    // choice more than smaller Ratio
    final double scale = widthRatio < heightRatio ? widthRatio : heightRatio;

    return Size(imageInfo!.width.toDouble() * scale,
        imageInfo!.height.toDouble() * scale);
  }

  /// define [imageWidth]
  @override
  double? get imageWidth {
    double? width;
    if (widget.fit == BoxFit.cover ||
        widget.fit == BoxFit.fill ||
        widget.fit == BoxFit.fitWidth) {
      // filled image area
      width = widget.width ?? imageInfo?.width.toDouble();
    } else {
      // scaleDown image area
      // contain, fitWidth, fitHeight, scaleDown
      width = widget.width ?? imageDisplayWidth;
    }
    // if you want Log resolve this annotation :)
    // debugPrint("widget.width:${widget.width}");
    // debugPrint("imageInfo?.width.toDouble():${imageInfo?.width.toDouble()}");
    // debugPrint("imageDisplayWidth:$imageDisplayWidth");
    // debugPrint("--->imageWidth:$width");
    return width;
  }

  /// define [imageHeight]
  @override
  double? get imageHeight {
    double? height;
    if (widget.fit == BoxFit.cover ||
        widget.fit == BoxFit.fill ||
        widget.fit == BoxFit.fitHeight) {
      // filled image area
      height = widget.height ?? imageInfo?.height.toDouble();
    } else {
      // scaleDown image area
      // contain, fitWidth,  scaleDown
      height = widget.height ?? imageDisplayHeight;
    }

    // if you want Log resolve this annotation :)
    // debugPrint("widget.height:${widget.height}");
    // debugPrint("imageInfo?.height.toDouble():${imageInfo?.height.toDouble()}");
    // debugPrint("imageDisplayHeight:$imageDisplayHeight");
    // debugPrint("--->imageHeight:$height");
    return height;
  }
}
