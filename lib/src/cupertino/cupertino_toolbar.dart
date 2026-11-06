import 'package:cupertino_ui/cupertino_ui.dart' show CupertinoTheme;
import 'package:flutter/widgets.dart';

class CupertinoToolbar extends StatelessWidget {
  final List<Widget> children;
  const CupertinoToolbar({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return Container();
    }
    return SafeArea(
      top: false,
      child: Container(
        height: 44.0,
        color: CupertinoTheme.of(context).barBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }
}
