import 'package:rive/rive.dart';

class RiveAsset {
  RiveAsset({
    required this.src,
    required this.stateMachineName,
    required this.duration,
    this.artboard,
    this.input,
  });

  final String src, stateMachineName;
  final String? artboard;
  final Duration duration;
  late SMIBool? input;

  set setInput(SMIBool status) {
    input = status;
  }
}
