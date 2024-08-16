import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 21,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/searchView');
            },
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            iconSize: 18,
          ),
        ],
      ),
    );
  }
}
