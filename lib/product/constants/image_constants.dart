enum ImageConstants {
  google,
  phone,
  mail,
  onBoardWorking,
  onBoardThinking,
  onBoardDeneme
}

extension ImageItemsExtention on ImageConstants {
  String _path() {
    switch (this) {
      case ImageConstants.google:
        return "google";
      case ImageConstants.phone:
        return "phone";
      case ImageConstants.mail:
        return "mail";
      case ImageConstants.onBoardWorking:
        return "onboard_working";
      case ImageConstants.onBoardThinking:
        return "onboard_thinking";
      case ImageConstants.onBoardDeneme:
        return "onboard_deneme";
    }
  }

  String get imagePath => "assets/images/${_path()}.png";
}
