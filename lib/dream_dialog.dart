import 'package:flutter/material.dart';

import '../../styling/dream_colours.dart';
import '../../styling/dream_text_styles.dart';
import '../../styling/haptic_feedback_types.dart';

class DreamDialog extends StatelessWidget {
  const DreamDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionButtons,
  });

  final String title;
  final String subtitle;
  final List<DreamDialogButton> actionButtons;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      surfaceTintColor: DreamColours.white,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 17),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: DreamTextStyles.blackSemibold18,
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: DreamTextStyles.blackRegular12,
            ),
            const SizedBox(height: 35),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: actionButtons.length,
              itemBuilder: (context, index) => actionButtons[index],
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}

enum DreamDialogButtonType {
  cancel,
  accept,
  decline,
}

class DreamDialogButton extends StatelessWidget {
  const DreamDialogButton({
    super.key,
    required this.text,
    required this.onTap,
    this.hapticFeedbackType = HapticFeedbackType.selectionClick,
    this.dreamDialogButtonType = DreamDialogButtonType.cancel,
  });

  final String text;
  final Function() onTap;
  final HapticFeedbackType hapticFeedbackType;
  final DreamDialogButtonType dreamDialogButtonType;

  @override
  Widget build(BuildContext context) {
    Color mainColour;
    Color secondaryColour;
    switch (dreamDialogButtonType) {
      case DreamDialogButtonType.accept:
        mainColour = DreamColours.selectionGreen;
        secondaryColour = DreamColours.white;
      case DreamDialogButtonType.decline:
        mainColour = DreamColours.red;
        secondaryColour = DreamColours.white;
      default:
        mainColour = DreamColours.white;
        secondaryColour = DreamColours.selectionGreen;
    }

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtilities().performHapticFeedback(hapticFeedbackType);
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: mainColour,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: secondaryColour,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 17,
            bottom: 14,
          ),
          child: Text(
            text,
            style: DreamTextStyles.semibold14.copyWith(color: secondaryColour),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}