import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            Text(
              'C O N T A C T  B U D D Y',
              style: TextStyle(
                fontSize: 25,
                //color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
