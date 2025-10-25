import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// An extension on `num` to provide convenient and **responsive** spacing shortcuts.
extension SpacingExtensions on num {
  /// Returns a responsive `SizedBox` with the current number as its height.
  SizedBox get hBox => SizedBox(height: toDouble().h);

  /// Returns a responsive `SizedBox` with the current number as its width.
  SizedBox get wBox => SizedBox(width: toDouble().w);

  /// Returns a responsive square `SizedBox`. Uses `.r` for optimal scaling.
  SizedBox get box => SizedBox(width: toDouble().r, height: toDouble().r);

  /// Returns responsive `EdgeInsets.all`. Uses `.r` for optimal scaling.
  EdgeInsets get padAll => EdgeInsets.all(toDouble().r);

  /// Returns responsive `EdgeInsets.symmetric(horizontal: ...)`
  EdgeInsets get padH => EdgeInsets.symmetric(horizontal: toDouble().w);

  /// Returns responsive `EdgeInsets.symmetric(vertical: ...)`
  EdgeInsets get padV => EdgeInsets.symmetric(vertical: toDouble().h);

  /// Returns responsive `EdgeInsets.only(top: ...)`
  EdgeInsets get padT => EdgeInsets.only(top: toDouble().h);

  /// Returns responsive `EdgeInsets.only(bottom: ...)`
  EdgeInsets get padB => EdgeInsets.only(bottom: toDouble().h);

  /// Returns responsive `EdgeInsets.only(left: ...)`
  EdgeInsets get padL => EdgeInsets.only(left: toDouble().w);

  /// Returns responsive `EdgeInsets.only(right: ...)`
  EdgeInsets get padR => EdgeInsets.only(right: toDouble().w);

  /// Returns responsive `BorderRadius.circular(...)`
  BorderRadius get rBox => BorderRadius.circular(toDouble().r);
}
