import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getController(
    Artboard artboard, {
    stateMachine = "stateMachineName 1",
  }) {
    final StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachine);
    artboard.addController(controller!);
    return controller;
  }
}
