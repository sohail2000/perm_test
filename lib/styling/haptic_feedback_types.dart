import 'package:flutter/services.dart';

enum HapticFeedbackType {
  selectionClick,
  lightImpact,
  mediumImpact,
  heavyImpact,
  vibrate
}

class HapticFeedbackUtilities {
  void performHapticFeedback(HapticFeedbackType hapticFeedbackType) {
    switch (hapticFeedbackType) {
      case HapticFeedbackType.selectionClick:
        HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.lightImpact:
        HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.mediumImpact:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavyImpact:
        HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.vibrate:
        HapticFeedback.vibrate();
        break;
    }
  }
}
