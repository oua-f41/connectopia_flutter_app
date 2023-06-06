enum ImageConstants { google, phone, mail }

extension ImageItemsExtention on ImageConstants {
  String _path() {
    switch (this) {
      case ImageConstants.google:
        return "google";
      case ImageConstants.phone:
        return "phone";
      case ImageConstants.mail:
        return "mail";
    }
  }

  String get imagePath => "assets/images/${_path()}.png";
}
