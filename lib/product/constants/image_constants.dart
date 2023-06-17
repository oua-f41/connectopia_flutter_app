enum ImageConstants {
  google,
  onBoardAnnouncement,
  onBoardNetworking,
  onBoardHelping,
}

extension ImageItemsExtention on ImageConstants {
  String _path() {
    switch (this) {
      case ImageConstants.google:
        return "google";
      case ImageConstants.onBoardAnnouncement:
        return "onboard_announcement";
      case ImageConstants.onBoardHelping:
        return "onboard_helping";
      case ImageConstants.onBoardNetworking:
        return "onboard_networking";
    }
  }

  String get imagePath => "assets/images/${_path()}.png";
}
