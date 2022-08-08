
import 'package:base_clean_arch/core/extensions/no_animation_material_page_route.dart';
import 'package:base_clean_arch/core/utils/responsive.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return NoAnimationMaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeScreen(),
      tablet: HomeScreen(),
    );
  }
}
