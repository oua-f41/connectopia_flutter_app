import '../../../../product/constants/lottie_constants.dart';
import '../../../../product/constants/text_constants.dart';

class Onboard {
  final String title;
  final String description;
  final String lottiePath;

  Onboard(this.title, this.description, this.lottiePath);
}

class OnboardItems {
  static final List<Onboard> datas = [
    Onboard(TextConstants.onboardFirstTitle, TextConstants.onboardFirstSubtitle,
        LottieConstants.onboardThinking.lottiePath),
    Onboard(
        TextConstants.onboardSecondTitle,
        TextConstants.onboardSecondSubtitle,
        LottieConstants.onboardTeam.lottiePath),
    Onboard(TextConstants.onboardThirdTitle, TextConstants.onboardThirdSubtitle,
        LottieConstants.onboardProject.lottiePath)
  ];
}
