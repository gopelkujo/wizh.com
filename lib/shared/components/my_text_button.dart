import 'package:flutter/material.dart';

class MyTextButton extends StatefulWidget {
  const MyTextButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  /// Button clicked indicator value change notifier.
  late final ValueNotifier<bool> _clickedNotifier;

  @override
  void initState() {
    super.initState();
    _clickedNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _clickedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _clickedNotifier,
      builder: (context, isClicked, child) {
        final textColor = Theme.of(context).colorScheme.primary;

        return GestureDetector(
          onTap: widget.onPressed,
          onTapDown: (details) => _clickedNotifier.value = true,
          onTapUp: (details) {
            if (widget.onPressed == null) return;

            widget.onPressed!();
            Future.delayed(const Duration(milliseconds: 300)).then((_) {
              _clickedNotifier.value = false;
            });
          },
          onTapCancel: () => _clickedNotifier.value = false,
          child: AnimatedOpacity(
            opacity: isClicked ? 0.5 : 1,
            duration: const Duration(milliseconds: 300),
            child: Text(widget.text, style: TextStyle(color: textColor)),
          ),
        );
      },
    );
  }
}
