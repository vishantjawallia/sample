import '../config/Palettes.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgress extends StatelessWidget {
  final Widget? child;
  final bool load;
  const CustomProgress({
    Key? key,
    this.child,
    this.load = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 0.1,
      opacity: 0.1,
      color: Palettes.primary,
      inAsyncCall: load,
      progressIndicator: const CircularProgressIndicator(
        color: Palettes.primary,
      ),
      child: child!,
    );
  }
}
