import 'package:flutter/material.dart';

import '../constants/resources.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final _emailInputController = TextEditingController();
  final _email = '';
  bool _emailSubmitted = false;

  void _submit() {
    // if there is no error text
    setState(() => _emailSubmitted = true);
    if (_emailErrorText == null) {
      widget.onSubmit(_emailInputController.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    const generalTextInputBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 2, color: grayColor),
    );
    const generalTextInputFocusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 2, color: primaryColor),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 72.0),
                child: Center(
                    child: SizedBox(
                        child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: SizedBox(
                        width: 122, height: 122, child: Image.asset(foodGreen)),
                  ),
                  const Text(
                    appName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 36,
                        decoration: TextDecoration.none),
                  )
                ])))),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 62),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              decoration: TextDecoration.none),
                        )),
                    TextField(
                      controller: _emailInputController,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        enabledBorder: generalTextInputBorderStyle,
                        errorBorder: generalTextInputBorderStyle,
                        focusedBorder: generalTextInputFocusedBorderStyle,
                        focusedErrorBorder: generalTextInputFocusedBorderStyle,
                        errorText: _emailSubmitted ? _emailErrorText : null,
                      ),
                      onChanged: (text) => setState(() => _email),
                    )
                  ],
                )),
            const Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 12, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: <Widget>[
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            decoration: TextDecoration.none),
                      )),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: generalTextInputBorderStyle,
                        errorBorder: generalTextInputBorderStyle,
                        focusedBorder: generalTextInputFocusedBorderStyle,
                        focusedErrorBorder: generalTextInputFocusedBorderStyle),
                  )
                ])),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 50.0, bottom: 0),
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed:
                          _emailInputController.value.text.isNotEmpty ? _submit : null,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    )))
          ]
        )
      )
    );
  }

  String? get _emailErrorText {
    // at any time, we can get the text from _controller.value.text
    final text = _emailInputController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(text)) {
      return 'Email not valid';
    }
    // return null if the text is valid
    return null;
  }

  @override
  void dispose() {
    _emailInputController.dispose();
    super.dispose();
  }
}
