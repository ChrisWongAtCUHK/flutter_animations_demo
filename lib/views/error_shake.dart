// [Add Error Shake Effect to TextFields | Flutter](https://alitalhacoban.medium.com/add-error-shake-effect-to-textfields-flutter-7e8e549e96b5)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error Shake'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    maxLines: 1,
                    onChanged: (text) {
                      setState(() {
                        _isTextFieldError = (text.isEmpty);
                      });
                    },
                    controller: _controllerTextField,
                    decoration: InputDecoration(
                        labelText: 'Input your data',
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
                        hintText: 'Input your data',
                        errorText: _isTextFieldError
                            ? 'This field cannot be left empty' // Error message
                            : null),
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
