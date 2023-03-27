import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_dvt/utils/view/sizes_util.dart';

import '../utils/view/font_styles_util.dart';
import '../utils/view/lottie_util.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(children: [
          Container(
            height: SizesUtil.phoneHeight * 0.5,
            alignment: Alignment.center,
            child: Lottie.asset(
              LottiePath.errorLottie,
            ),
          ),
          Text(
            message!,
            style: textStyleBoldRed36,
          )
        ]),
      ),
    );
  }
}
