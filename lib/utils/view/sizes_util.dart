import '../size_config.dart';

class SizesUtil {
  //Total phone width
  static double phoneWidth = SizeConfig.widthMultiplier! * 100;
  // Total phone height
  static double phoneHeight = SizeConfig.heightMultiplier! * 100;
  //Text Size
  static double textSize = SizeConfig.heightMultiplier! * 100;

  static double textSize_42 = textSize * 7.2 / 100;
  static double textSize_36 = textSize * 6.5 / 100;
  static double textSize_22 = textSize * 3.9 / 100;
  static double textSize_12 = textSize * 2.2 / 100;
  static double textSize_16 = textSize * 2.9 / 100;
}
