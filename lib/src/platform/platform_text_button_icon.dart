import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoButton;
import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show ButtonStyle, TextButton;

/// Simple replacement for `TextButton.icon`
class PlatformTextButtonIcon extends StatelessWidget {
  final Key? widgetKey;
  final void Function() onPressed;
  final void Function()? onLongPress;
  final Widget icon;
  final Widget label;
  final bool autofocus;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final Clip? clipBehavior;

  /// only applicable for cupertino
  final Color? backgroundColor;

  /// Important: onLongPress, autofocus, focusNode and clip behavior are not supported for cupertino
  const PlatformTextButtonIcon({
    Key? key,
    this.widgetKey,
    required this.onPressed,
    required this.icon,
    this.onLongPress,
    required this.label,
    this.autofocus = false,
    this.style,
    this.focusNode,
    this.clipBehavior,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (context, platform) => TextButton.icon(
        key: widgetKey,
        onPressed: onPressed,
        onLongPress: onLongPress,
        label: label,
        icon: icon,
        style: style,
        focusNode: focusNode,
        clipBehavior: clipBehavior,
        autofocus: autofocus,
      ),
      cupertino: (context, platform) => CupertinoButton(
        color: backgroundColor,
        padding: const EdgeInsets.all(8.0),
        key: widgetKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon,
            ),
            Expanded(
              child: label,
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
