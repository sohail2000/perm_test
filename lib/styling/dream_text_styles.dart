import 'package:flutter/material.dart';

import 'dream_colours.dart';
import 'dream_font_weights.dart';

class DreamTextStyles {
  // --- Black fonts ---
  static const TextStyle blackRegular12 = TextStyle(
    color: DreamColours.black,
    fontSize: 12,
    fontWeight: DreamFontWeights.regular,
  );
  static const TextStyle blackRegular14 = TextStyle(
    color: DreamColours.black,
    fontSize: 14,
    fontWeight: DreamFontWeights.regular,
  );

  static const TextStyle blackMedium12 = TextStyle(
    color: DreamColours.black,
    fontSize: 12,
    fontWeight: DreamFontWeights.medium,
  );

  static const TextStyle blackMedium14 = TextStyle(
    color: DreamColours.black,
    fontSize: 14,
    fontWeight: DreamFontWeights.medium,
    height: 16 / 14,
  );

  static const TextStyle blackMedium16 = TextStyle(
    color: DreamColours.black,
    fontSize: 16,
    fontWeight: DreamFontWeights.medium,
  );

  static const TextStyle blackSemibold12 = TextStyle(
    color: DreamColours.black,
    fontSize: 12,
    fontWeight: DreamFontWeights.semiBold,
  );

  static const TextStyle blackSemibold16 = TextStyle(
    color: DreamColours.black,
    fontSize: 16,
    fontWeight: DreamFontWeights.semiBold,
  );

  static const TextStyle blackSemibold18 = TextStyle(
    color: DreamColours.black,
    fontSize: 18,
    fontWeight: DreamFontWeights.semiBold,
  );

  static const TextStyle blackSemibold24 = TextStyle(
    color: DreamColours.black,
    fontSize: 24,
    fontWeight: DreamFontWeights.semiBold,
  );

  static const TextStyle blackBold14 = TextStyle(
    color: DreamColours.black,
    fontSize: 14,
    fontWeight: DreamFontWeights.bold,
  );

  // --- White fonts ---
  static const TextStyle whiteMedium12 = TextStyle(
    color: DreamColours.white,
    fontSize: 12,
    fontWeight: DreamFontWeights.medium,
  );

  static const TextStyle whiteSemibold14 = TextStyle(
    color: DreamColours.white,
    fontSize: 14,
    fontWeight: DreamFontWeights.semiBold,
  );

  static const TextStyle whiteSemibold16 = TextStyle(
    color: DreamColours.white,
    fontSize: 16,
    fontWeight: DreamFontWeights.semiBold,
  );

  // --- Grey fonts ---
  static TextStyle greyRegular12 = TextStyle(
    color: DreamColours.black.withOpacity(0.75),
    fontSize: 12,
    fontWeight: DreamFontWeights.regular,
  );

  // --- Light grey fonts ---
  static TextStyle lightGreyMedium12 = TextStyle(
    color: DreamColours.black.withOpacity(0.5),
    fontSize: 12,
    fontWeight: DreamFontWeights.medium,
  );

  static TextStyle lightGreyMedium14 = TextStyle(
    color: DreamColours.black.withOpacity(0.5),
    fontSize: 14,
    fontWeight: DreamFontWeights.medium,
  );
  // --- Green fonts ---
  static const TextStyle greenMedium12 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 12,
    fontWeight: DreamFontWeights.medium,
  );

  static const TextStyle greenMedium14 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 14,
    fontWeight: DreamFontWeights.medium,
  );

  static const TextStyle greenSemibold14 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 14,
    fontWeight: DreamFontWeights.semiBold,
  );
  
    static const TextStyle greenSemibold18 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 18,
    fontWeight: DreamFontWeights.semiBold,
  );

  static const TextStyle greenBold14 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 14,
    fontWeight: DreamFontWeights.bold,
  );

  static const TextStyle greenBold18 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 18,
    fontWeight: DreamFontWeights.bold,
  );

  static const TextStyle greenBold20 = TextStyle(
    color: DreamColours.selectionGreen,
    fontSize: 20,
    fontWeight: DreamFontWeights.bold,
  );

  // -- Unspecified color fonts
  static const TextStyle semibold14 = TextStyle(
    fontSize: 14,
    fontWeight: DreamFontWeights.semiBold,
  );

  // ---Red Fonts ---
  static const TextStyle redMedium14 = TextStyle(
    color: DreamColours.red,
    fontSize: 14,
    fontWeight: DreamFontWeights.medium,
  );
}
