import 'package:f41/features/onboard/presentation/widgets/onboard_bottom_bar.dart';
import 'package:f41/features/onboard/presentation/widgets/onboard_card.dart';
import 'package:flutter/material.dart';

import '../../../product/constants/color_constants.dart';
import '../../../product/widgets/project_back_button.dart';
import '../../../product/widgets/skip_button.dart';
import 'models/onboard_model.dart';
import 'onboard_view_model.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends OnboardPageModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            Expanded(
              flex: 14,
              child: PageView.builder(
                controller: onBoardPageController,
                onPageChanged: (value) {
                  setSelectedPage(value);
                },
                itemCount: OnboardItems.datas.length,
                itemBuilder: (context, index) {
                  return OnboardCard(
                    index: index,
                    onboard: OnboardItems.datas[index],
                  );
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: OnboardBottomBar(
                  isLastItem: isLastItem,
                  index: currentIndex,
                  onPressButton: () {
                    incrementSelectedPage();
                  }),
            )
          ],
        ));
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: ColorConstants.transparent,
      leading: isFirstItem
          ? null
          : ProjectBackButton(onPressed: () {
              reductiomSelectedPage();
            }),
      actions: [
        ValueListenableBuilder(
            valueListenable: isBackEnable,
            builder: (context, value, child) {
              return value
                  ? SkipButton(
                      onPressed: () {
                        goToLogin();
                      },
                    )
                  : const SizedBox();
            })
      ],
    );
  }
}
