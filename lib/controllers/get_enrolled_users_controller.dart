import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:soccerq_mobile/models/course_enrolled_model.dart';

import '../services/remote_services.dart';

class GetEnrolledUsersController extends GetxController {
  var isLoading = false.obs;
  var enrolledUsers = <CourseEnrolledUsers>[].obs;

  // @override
  // void onInit() {
  //   getEnrolledUsers();
  //   super.onInit();
  // }

  void getEnrolledUsers() async {
    try {
      isLoading(true);

      var enrolledUser = await RemoteServices.getEnrolledUsers();
      if (enrolledUser != null) {
        enrolledUsers.value = enrolledUser;
      }
    } finally {
      isLoading(false);
    }
  }
}
