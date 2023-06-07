import 'package:f41/product/constants/lottie_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../product/constants/image_constants.dart';
import 'widgets/login_option_button.dart';

class MainLoginPage extends StatelessWidget {
  const MainLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
              child:
                  Lottie.asset(LottieConstants.mainLoginAnimation.lottiePath)),
          Container(
            child: Column(
              children: [
                LoginOptionButton(
                  symbol: Image.asset(ImageConstants.mail.imagePath),
                  text: 'Log In with Email',
                  onPressed: () {
                    print("Email ile giriş yap");
                  },
                ),
                LoginOptionButton(
                  symbol: Image.asset(ImageConstants.phone.imagePath),
                  text: 'Log in with phone',
                  onPressed: () {
                    print('Log in with phone');
                  },
                ),
                LoginOptionButton(
                  symbol: Image.asset(ImageConstants.google.imagePath),
                  text: 'Log in with Google',
                  onPressed: () {
                    print('Log in with Google');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
