import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_sample_app/constants/resources.dart';
import 'login.dart';

class SplashDemo extends StatefulWidget {
  const SplashDemo({super.key});

  @override
  _SplashDemo createState() => _SplashDemo();
}

class _SplashDemo extends State<SplashDemo> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginDemo(
                      onSubmit: (String value) {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => const HomeDemo()));
                      },
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColor,
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: SizedBox(
                        width: 122, height: 122, child: Image.asset(foodWhite)),
                  ),
                  const Text(
                    appName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 36,
                        decoration: TextDecoration.none),
                  )
                ]
              )
            )));
  }
}
