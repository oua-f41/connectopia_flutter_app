enum LottieConstants {
  onboardThinking,
  onboardTeam,
  onboardProject,
  mainLoginAnimation,
  loadingAnimation,
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
      case LottieConstants.loadingAnimation:
        return "loading_animation";
    }
  }

  String get lottiePath => "assets/lottie/${_path()}.json";
}
