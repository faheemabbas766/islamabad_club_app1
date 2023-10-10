import 'dart:ui';
import 'package:islamabad_club_app/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillAmber600 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.amber600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      );
  static ButtonStyle get fillAmber600TL24 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.amber600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
        ),
      );
  static ButtonStyle get fillAmber600TL5 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.amber600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
      );
  static ButtonStyle get fillBluegray900 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.blueGray900.withOpacity(0.32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      );
  static ButtonStyle get fillGray50 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
      );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      );
  static ButtonStyle get fillPrimaryContainer => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            3,
          ),
        ),
      );
  static ButtonStyle get fillPrimaryTL3 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            3,
          ),
        ),
      );
  static ButtonStyle get fillYellow70019 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.yellow70019,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      );
  // Outline button style
  static ButtonStyle get outlineAmber600 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.amber600,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      );
  static ButtonStyle get outlineOnPrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        shadowColor: theme.colorScheme.onPrimary,
        elevation: 8,
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
