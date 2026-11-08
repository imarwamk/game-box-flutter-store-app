import 'package:flutter/material.dart';

const double _designWidth = 390;
const double _textDesignWidth = 430;
const double _minScale = 0.8;
const double _maxSizeScale = 1.3;
const double _maxTextScale = 1.1;

/// Screens stay readable on wide displays instead of stretching edge to edge.
const double maxContentWidth = 900;

extension ResponsiveSize on BuildContext {
  /// Scales a size designed for a 390-wide phone to the current screen.
  double rs(double value) {
    final scale = MediaQuery.sizeOf(this).shortestSide / _designWidth;
    return value * scale.clamp(_minScale, _maxSizeScale);
  }
}

/// Fits text to the screen while keeping the user's accessibility setting.
TextScaler responsiveTextScaler(BuildContext context) {
  final media = MediaQuery.of(context);
  final fit = (media.size.shortestSide / _textDesignWidth).clamp(
    _minScale,
    _maxTextScale,
  );
  return TextScaler.linear(media.textScaler.scale(1) * fit);
}
