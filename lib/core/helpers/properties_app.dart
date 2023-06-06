class PropertiesApp {
  PropertiesApp({this.isFirstTime = true});
  late bool isFirstTime;

  void changeFirst() {
    isFirstTime = false;
  }
}
