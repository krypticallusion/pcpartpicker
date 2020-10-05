import 'package:get/get.dart';

import '../api/api.dart';

class APIService extends GetxController {
  Rx<RxBuildGuides> guideDetails = Rx<RxBuildGuides>();
  Rx<RxGuideDetails> gDetails = Rx<RxGuideDetails>();
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    guideDetails.value = await getBuildGuides();
  }

  void fetchGuideDetails(String path) async {
    gDetails.value = null;
    gDetails.value = await getDetails(path: path);
  }
}
