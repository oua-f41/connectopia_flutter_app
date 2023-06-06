enum LottieConstants {
  onboardThinking,
  onboardTeam,
  onboardProject,
  mainLoginAnimation
}

extension LottieItemsExtention on LottieConstants {
  String _path() {
    switch (this) {
      case LottieConstants.onboardThinking:
        return "onboard_thinking";
      case LottieConstants.onboardTeam:
        return "onboard_team";
      case LottieConstants.onboardProject:
        return "onboard_project";
      case LottieConstants.mainLoginAnimation:
        return "main_login_animation";
    }
  }

  String get lottiePath => "assets/lottie/${_path()}.json";
}
