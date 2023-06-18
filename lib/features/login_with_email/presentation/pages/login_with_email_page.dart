import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../../../product/constants/lottie_constants.dart';
import '../../../../product/widgets/title_text.dart';
import '../widgets/login_with_email_form.dart';

@RoutePage()
class LoginWithEmailPage extends StatelessWidget {
  const LoginWithEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: context.durationLow,
              height: context.isKeyBoardOpen
                  ? context.dynamicHeight(0.22)
                  : context.dynamicHeight(0.35),
              child: SizedBox(
                width: context.dynamicWidth(0.6),
                child: Lottie.asset(
                  LottieConstants.mainLoginAnimation.lottiePath,
                ),
              ),
            ),
            Container(
                width: context.dynamicWidth(0.9),
                padding: context.paddingNormal,
                child: const TitleText(text: "Sign In")),
            Container(
                padding: context.horizontalPaddingMedium,
                child: const LoginWithEmailForm()),
          ],
        )),
      ),
    );
  }
}
