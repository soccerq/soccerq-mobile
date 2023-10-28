import 'package:get/get_connect/http/src/response/response.dart';
import 'package:soccerq_mobile/models/course_enrolled_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  // static Future<dynamic> validatePhone({required String phoneNo}) async {
  //   http.Response? _response;
  //   try {
  //     final body = jsonEncode({
  //       "phoneNumber": phoneNo.toString(),
  //     });
  //     _response = await http.post(Uri.parse(validatePhoneApi),
  //         body: body, headers: {"Content-Type": "application/json"});
  //     if (_response.statusCode == 200) {
  //       print("@@@@@@@@@@@@@@@@@@${_response.body}");
  //       var jsonMap = jsonDecode(_response.body);

  //       return jsonMap["OTP"];
  //     }
  //   } catch (e) {
  //     print("error thrown from Validate Phone api $e");
  //   }
  // }

  static Future getEnrolledUsers() async {
    http.Response? _response;
    CourseEnrolledUsers? enrolledUsers;
    try {
      _response = await http.get(
          Uri.parse(
              "https://moodledemo.moodlecloud.com/webservice/rest/server.php?wstoken=664631b75e825d06ddd6b308039f9915&wsfunction=core_enrol_get_enrolled_users&moodlewsrestformat=json&courseid=6"),
          headers: {
            "Content-Type": "application/json",
          });
      print("------------------------${_response.statusCode}");
      if (_response.statusCode == 200) {
        print("@@@@@@@@@@@@@@@@@@${_response.body}");
        var jsonMap = _response.body;

        return courseEnrolledUsersFromJson(jsonMap);
      }
    } catch (e) {
      print("error thrown from Enrolled users api $e");
    }
    return enrolledUsers;
  }
}
