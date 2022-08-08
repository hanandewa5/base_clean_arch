import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_clean_arch/core/constants/color_constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final IconData? iconData;
  final Widget? trailing;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.iconData,
    this.trailing,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: ColorConstants.white,
      iconTheme: const IconThemeData(
        color: ColorConstants.iconColor,
      ),
      title: Text(
        widget.title,
        style: TextStyle(color: ColorConstants.black, fontWeight: FontWeight.w700, fontSize: 18.sp),
      ),
      leading: widget.leading,
      actions: [
        widget.iconData != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  widget.iconData,
                  color: ColorConstants.iconColor,
                ),
              )
            : const SizedBox(),
        widget.trailing ?? const SizedBox(),
      ],
    );
  }

}
