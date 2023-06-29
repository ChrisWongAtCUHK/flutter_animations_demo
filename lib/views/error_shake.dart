// [Add Error Shake Effect to TextFields | Flutter](https://alitalhacoban.medium.com/add-error-shake-effect-to-textfields-flutter-7e8e549e96b5)
import 'dart:math';
import 'package:flutter/material.dart';

class ErrorShakeScreen extends StatefulWidget {
  const ErrorShakeScreen({super.key});

  @override
  State<ErrorShakeScreen> createState() => _ErrorShakeScreenState();
}

class _ErrorShakeScreenState extends State<ErrorShakeScreen> {
  // Controller object of our TextField
  final _controllerTextField = TextEditingController();

  // Boolean variable to check for errors
  bool _isTextFieldError = false;

  // GlobalKey object for ShakeWidgetState class
  final _textFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error Shake Effect'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ShakeWidget(
                    key: _textFieldErrorShakeKey,
                    shakeCount: 3,
                    shakeOffset: 10,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: TextField(
                      maxLines: 1,
                      onChanged: (text) {
                        setState(() {
                          _isTextFieldError = (text.isEmpty);
                        });
                      },
                      controller: _controllerTextField,
                      decoration: InputDecoration(
                          labelText: "Input your data",
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.lightBlue, width: 1.0),
                          ),
                          hintText: "Input your data",
                          errorText: _isTextFieldError
                              ? "This field cannot be left empty" // Error message
                              : null),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_controllerTextField.text.isEmpty) {
                      // do anything when it gives an error

                      setState(() {
                        // update error status
                        _isTextFieldError = true;
                        _textFieldErrorShakeKey.currentState?.shakeWidget();
                      });
                    } else {
                      // do anything when it doesn't give an error
                      var snackBar = SnackBar(
                          content: Text(
                              ' ${_controllerTextField.text} Data submitted successfully'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // to dismiss the on-screen keyboard
                      FocusManager.instance.primaryFocus?.unfocus();

                      setState(() {
                        // update error status
                        _isTextFieldError = false;
                      });
                    }
                  },
                  child: const Text('Submit Data'),
                ),
              ],
            ),
          ),
        ));
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 300),
  }) : super(key: key);
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  @override
  // ignore: no_logic_in_create_state
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateAnimationStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateAnimationStatus);
    super.dispose();
  }

  void _updateAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shakeWidget() {
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineValue =
            sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          // try to shake vertically, instead of horizontally
          // offset: Offset(0, sineValue * widget.shakeOffset),
          child: child,
        );
      },
    );
  }
}

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);

  final Duration animationDuration;
  late final animationController = AnimationController(
    vsync: this,
    duration: animationDuration,
  );

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
