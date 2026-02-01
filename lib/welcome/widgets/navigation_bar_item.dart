import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

import 'rive_asset.dart';
import '../../util/rive_utils.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    required this.riveAsset,
    required this.isSelected,
    required this.isPortrait,
    super.key,
  });

  final RiveAsset riveAsset;
  final bool isSelected;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    const defaultTimeAnimation = 300;
    const defaultRadius = 12.0;

    final SizedBox icon = SizedBox(
      height: 48,
      width: 48,
      child: Opacity(
        opacity: isSelected ? 1 : 0.5,
        child: RiveAnimation.asset(
          riveAsset.src,
          artboard: riveAsset.artboard,
          onInit: (artboard) {
            final StateMachineController controller = RiveUtils.getController(
              artboard,
              stateMachine: riveAsset.stateMachineName,
            );

            /// TODO: change color rive animation
            artboard.forEachComponent((child) {
              if (child is Stroke) {
                child.paint.color = Theme.of(context).colorScheme.primary;
              }
            });

            riveAsset.input = controller.findSMI("active");
          },
        ),
      ),
    );

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: defaultTimeAnimation),
          margin: const EdgeInsets.only(bottom: 2),
          height: 4,
          width: isSelected ? 20 : 0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        icon,
      ],
    );
  }
}
