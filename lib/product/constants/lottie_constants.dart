enum LottieConstants { mainLoginAnimation, loadingAnimation, loadingProgress }

extension LottieItemsExtention on LottieConstants {
  String _path() {
    switch (this) {
      case LottieConstants.mainLoginAnimation:
        return "main_login_animation";
      case LottieConstants.loadingAnimation:
        return "loading_animation";
      case LottieConstants.loadingProgress:
        return "loading_progress";
    }
  }

  String get lottiePath => "assets/lottie/${_path()}.json";
}
