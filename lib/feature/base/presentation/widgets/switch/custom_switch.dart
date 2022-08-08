import 'package:flutter/cupertino.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final double scale;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({
    Key? key,
    this.value = false,
    this.scale = 0.8,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  @override
  initState() {
    super.initState();
    _switchValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      transformHitTests: true,
      child: CupertinoSwitch(
        value: _switchValue,
        activeColor: ColorConstants.primary,
        onChanged: (value) {
          setState(() {
            _switchValue = !_switchValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}
