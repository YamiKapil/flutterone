import 'package:flutter/material.dart';

import '../../app/colors.dart';

/// Key cell on the Plingo Keyboard widget.
class PlingoKey extends StatelessWidget {
  /// Constructor
  const PlingoKey({
    Key? key,
    required this.letter,
    this.color,
  }) : super(key: key);

  /// The letter to be displayed
  final String letter;

  /// Background color used for this key.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        // TODO: Implement event for letter pressed.
        onTap: () {},
        splashColor: AppColors.primary.withOpacity(0.3),
        child: Center(
          child: Text(
            letter.toUpperCase(),
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
