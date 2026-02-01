import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'widgets/navigation_bar_item.dart';
import 'widgets/rive_asset.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _selectedIndex = ValueNotifier(0);
  final List<RiveAsset> _assets = [
    RiveAsset(
      src: "assets/animations/button_animation.riv",
      artboard: "HOME",
      stateMachineName: "HOME_Interact",
      duration: const Duration(seconds: 2),
    ),
    RiveAsset(
      src: "assets/animations/button_animation.riv",
      artboard: "DOC",
      stateMachineName: "DOC_Interact",
      duration: const Duration(seconds: 1),
    ),
    RiveAsset(
      src: "assets/animations/button_animation.riv",
      artboard: "USER",
      stateMachineName: "USER_Interact",
      duration: const Duration(seconds: 3),
    ),
    // RiveAsset(
    //   src: "assets/animations/button_animation.riv",
    //   artboard: "SEARCH",
    //   stateMachineName: "SEARCH_Interact",
    //   duration: const Duration(seconds: 2),
    // ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex.addListener(() {
      final currentIndex = _selectedIndex.value;
      _assets[currentIndex].input?.value = true;

      Future.delayed(_assets[currentIndex].duration, () {
        _assets[currentIndex].input?.value = false;
      });
    });
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, selectedIndex, child) {
              return Wrap(
                children: _assets.mapIndexed((index, e) {
                  return GestureDetector(
                    onTap: () => _selectedIndex.value = index,
                    child: NavigationBarItem(
                      riveAsset: e,
                      isSelected: selectedIndex == index,
                      isPortrait: true,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
