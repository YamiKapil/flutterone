import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, this.errorText}) : super(key: key);
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText!.isNotEmpty,
      child: SizedBox(
        child: Text(
          errorText ?? '',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
