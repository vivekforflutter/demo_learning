import 'package:get/get.dart';
import 'package:theme_test/localization/localization.dart';


String? getTranslatedValues(String key) {
  return DemoLocalizations.of(Get.context!)?.getTranslatedValue(key);
}
