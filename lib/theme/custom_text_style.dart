import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: getFontSize(
          15,
        ),
      );
  static get titleSmallInterAmber600 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.amber600,
      );
  static get titleLargeBlack90002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray100 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray100,
      );
  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: getFontSize(
          15,
        ),
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBlack90001SemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBlack90002Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBlack90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleSmallBlack90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );
  static get titleSmallBlack90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90002.withOpacity(0.5),
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumRedHatDisplayAmber600 =>
      theme.textTheme.titleMedium!.redHatDisplay.copyWith(
        color: appTheme.amber600,
        fontSize: getFontSize(
          19,
        ),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimaryContainerMedium_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray200 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray200,
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleMediumOnPrimaryContainerMedium =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: getFontSize(
          18,
        ),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimaryContainer17 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: getFontSize(
          17,
        ),
      );
  static get titleSmallAmber600_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.amber600,
      );
  static get titleMediumOnPrimaryContainer18 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: getFontSize(
          18,
        ),
      );
  static get titleSmallCyan400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.cyan400,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSemiBold_1 => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleMediumOnPrimaryContainer_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get titleSmallAmberA200 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.amberA200,
      );
  static get titleMediumRedHatDisplayBlack900 =>
      theme.textTheme.titleMedium!.redHatDisplay.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallOnPrimaryContainerSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallAmber600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.amber600,
      );
  static get titleMediumBlack90002_2 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBlack90002_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002,
      );
  static get titleMediumBlack900Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallRedHatDisplayGray50001 =>
      theme.textTheme.titleSmall!.redHatDisplay.copyWith(
        color: appTheme.gray50001,
      );
  static get titleSmallGray50001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50001.withOpacity(0.6),
      );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );
  static get titleSmallBluegray400 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray400,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleLargeRedHatDisplay =>
      theme.textTheme.titleLarge!.redHatDisplay.copyWith(
        fontSize: getFontSize(
          22,
        ),
        fontWeight: FontWeight.w700,
      );
  // Red text style
  static get redHatDisplayBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w700,
      ).redHatDisplay;
  // Montserrat text style
  static get montserratOnPrimaryContainerBold => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratGray900Medium => TextStyle(
        color: appTheme.gray900,
        fontSize: getFontSize(
          5,
        ),
        fontWeight: FontWeight.w500,
      ).montserrat;
  static get montserratGray900SemiBold6 => TextStyle(
        color: appTheme.gray900,
        fontSize: getFontSize(
          6,
        ),
        fontWeight: FontWeight.w600,
      ).montserrat;
  static get montserratOnPrimaryContainer => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: getFontSize(
          5,
        ),
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratGray900 => TextStyle(
        color: appTheme.gray900,
        fontSize: getFontSize(
          5,
        ),
        fontWeight: FontWeight.w700,
      ).montserrat;
  static get montserratGray900Medium6 => TextStyle(
        color: appTheme.gray900,
        fontSize: getFontSize(
          6,
        ),
        fontWeight: FontWeight.w500,
      ).montserrat;
  static get montserratGray900SemiBold => TextStyle(
        color: appTheme.gray900,
        fontSize: getFontSize(
          7,
        ),
        fontWeight: FontWeight.w600,
      ).montserrat;
  // Headline text style
  static get headlineMediumBlack900 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900,
        fontSize: getFontSize(
          27,
        ),
      );
  // Label text style
  static get labelLargeBlack90002_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get labelLargeGray500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeAmber600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.amber600,
      );
  static get labelLargeGray50001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50001,
        fontSize: getFontSize(
          13,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get labelLargeBluegray400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray400,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallBlack90002 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black90002.withOpacity(0.3),
        fontSize: getFontSize(
          8,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelLargeRedHatDisplayBlack900 =>
      theme.textTheme.labelLarge!.redHatDisplay.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get labelSmallInterBlack90002 =>
      theme.textTheme.labelSmall!.inter.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeAmber600Medium => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.amber600,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeBlack90002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeAmber700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.amber700,
        fontSize: getFontSize(
          13,
        ),
        fontWeight: FontWeight.w500,
      );
  static get labelLargePlusJakartaSansAmber600 =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.amber600,
      );
  static get labelLargeOrange600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.orange600,
      );
  // Display text style
  static get displaySmallGray90001 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.gray90001,
      );
  static get displaySmallErrorContainer =>
      theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get displaySmallPrimary => theme.textTheme.displaySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Body text style
  static get bodySmallMontserratBlack90002 =>
      theme.textTheme.bodySmall!.montserrat.copyWith(
        color: appTheme.black90002.withOpacity(0.3),
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodyMediumGray20002_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray20002,
      );
  static get bodyMediumBlack90002_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.6),
      );
  static get bodyMediumBlack90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.5),
      );
  static get bodyMediumGray20002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray20002,
      );
  static get bodySmallRedHatDisplayGray50001 =>
      theme.textTheme.bodySmall!.redHatDisplay.copyWith(
        color: appTheme.gray50001,
        fontSize: getFontSize(
          12,
        ),
      );
  static get bodySmallMontserratBlack9000212 =>
      theme.textTheme.bodySmall!.montserrat.copyWith(
        color: appTheme.black90002,
        fontSize: getFontSize(
          12,
        ),
      );
  static get bodySmallMontserratGray600 =>
      theme.textTheme.bodySmall!.montserrat.copyWith(
        color: appTheme.gray600,
        fontSize: getFontSize(
          10,
        ),
      );
  // D text style
  static get dMSansBluegray90001 => TextStyle(
        color: appTheme.blueGray90001,
        fontSize: getFontSize(
          4,
        ),
        fontWeight: FontWeight.w400,
      ).dMSans;
  static get dMSansBlack90002 => TextStyle(
        color: appTheme.black90002,
        fontSize: getFontSize(
          4,
        ),
        fontWeight: FontWeight.w400,
      ).dMSans;
}

extension on TextStyle {
  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }

  TextStyle get redHatDisplay {
    return copyWith(
      fontFamily: 'Red Hat Display',
    );
  }
}
