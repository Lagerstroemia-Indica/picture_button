import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,

    required this.onPressed,

    this.splashColor,

    this.bubbleEffect = false
  });

  final VoidCallback onPressed;

  final Color? splashColor;
  /// if you onPressed Event ImageButton Widget,
  /// Widget show you bubble effect.
  ///
  /// [bubbleEffect] default is 'false'
  final bool bubbleEffect;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Simple ImageButton",
    );
  }
}
