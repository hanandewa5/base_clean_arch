import 'package:flutter/material.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';

class Toast {
  static void show(String msg, BuildContext context, {Duration? duration}) {
    Color textColor = Colors.white;
    Color backgroundColor = ColorConstants.dark;
    dismiss();
    Toast._createView(msg, context, backgroundColor, textColor, duration ?? const Duration(seconds: 2));
  }

  static late OverlayEntry _overlayEntry;
  static bool isVisible = false;

  static void _createView(
    String msg,
    BuildContext context,
    Color background,
    Color textColor,
    Duration duration,
  ) async {
    var overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _ToastAnimatedWidget(
        duration: duration,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.white,
                ),
                child: Text(
                  msg,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    isVisible = true;
    overlayState?.insert(_overlayEntry);
  }

  static dismiss() async {
    if (!isVisible) {
      return;
    }
    isVisible = false;
    _overlayEntry.remove();
  }
}

class _ToastAnimatedWidget extends StatefulWidget {
  const _ToastAnimatedWidget({
    Key? key,
    required this.duration,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastAnimatedWidget> with SingleTickerProviderStateMixin {
  bool _isVisible = true; //update this value later

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(widget.duration, () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
    return Positioned(
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _isVisible ? 0.7 : 0.0,
        child: widget.child,
      ),
    );
  }
}
