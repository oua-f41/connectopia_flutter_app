import 'package:flutter/cupertino.dart';

import '../../../../product/constants/edgeInsents_constants.dart';
import '../../../../product/widgets/description_text.dart';
import '../../../../product/widgets/title_text.dart';
import '../models/onboard_model.dart';
import '../onboard_view_model.dart';
import 'onboard_image.dart';

class OnboardCard extends StatelessWidget {
  const OnboardCard({
    super.key,
    required this.index,
    required this.onboard,
  });

  final int index;
  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection:
          index % 2 == 0 ? VerticalDirection.down : VerticalDirection.up,
      children: [
        Container(
          padding: EdgeInsetsConstants.onboardTextsPadding,
          child: Column(
            children: [
              TitleText(text: onboard.title),
              DescriptionText(text: onboard.description),
            ],
          ),
        ),
        OnboardLottie(lottiePath: onboard.lottiePath),
      ],
    );
  }
}
