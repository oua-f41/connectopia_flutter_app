import '../../../../product/constants/image_constants.dart';

class OnboardModel {
  final String title;
  final String image;
  final String desc;

  OnboardModel({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardModel> contents = [
  OnboardModel(
    title: "Track Your work and get the result",
    image: ImageConstants.onBoardWorking.imagePath,
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardModel(
    title: "Stay organized with team",
    image: ImageConstants.onBoardThinking.imagePath,
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardModel(
    title: "Get notified when work happens",
    image: ImageConstants.onBoardDeneme.imagePath,
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
