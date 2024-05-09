import 'package:dubmeio_utils/src/constants/breakpoints.dart';
import 'package:flutter/widgets.dart';

/// Shorthands for a set of breakpoints that can be used to build responsive UIs.
extension BreakPoints on BuildContext {
  /// Returns `true` if the shortest side of the device is `>= 600`.
  bool get isTablet =>
      MediaQuery.sizeOf(this).shortestSide >= Breakpoint.tablet;

  /// Returns `true` if the shortest side of the device is `>= 900`.
  bool get isDesktop =>
      MediaQuery.sizeOf(this).shortestSide >= Breakpoint.desktop;

  /// Returns `true` if the shortest side of the device is `< 600`.
  /// This is the same as `!isTablet`.
  bool get isMobile => MediaQuery.sizeOf(this).shortestSide < Breakpoint.tablet;
}