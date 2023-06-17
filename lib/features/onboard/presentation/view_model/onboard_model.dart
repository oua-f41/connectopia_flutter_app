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
    title: "Toplulukları Keşfet, Etkinlikleri Kaçırma!",
    image: ImageConstants.onBoardNetworking.imagePath,
    desc:
        "Connectopia'da sosyal sorumluluk projeleri, kariyer veya kişisel gelişim için etkinlikler bulabilir, topluluklarda, sizin alanınızdaki insanlarla yeni bağlantılar kurabilirsiniz.",
  ),
  OnboardModel(
    title: "Kendi topluluğunu kur, etkinliğini duyur!",
    image: ImageConstants.onBoardAnnouncement.imagePath,
    desc:
        "Connectopia'da kendi topluluğunu oluşturabilir ve etkinlikler düzenleyip paylaşabilirsin.",
  ),
  OnboardModel(
    title: "Toplulukları Destekle, Gelişimlerine Katkıda Bulun!",
    image: ImageConstants.onBoardHelping.imagePath,
    desc:
        "Connectopia'da topluluklara bağış yapabilir veya kendi topluluğuna bağış alabilirsin. Unutma, bağışlar, toplulukların büyümesine yardımcı olacaktır.",
  ),
];
