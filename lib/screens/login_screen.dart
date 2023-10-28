import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/get_enrolled_users_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //DioController personController = Get.put(DioController());

  final GetEnrolledUsersController getEnrolledUsersController =
      Get.put(GetEnrolledUsersController());

  TextEditingController usernameTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  bool showLoading = false;

  getMobileFormWidget(context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Please enter your phone number to proceed",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              // const Spacer(),
              TextField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                maxLength: 13,
                keyboardType: TextInputType.text,
                controller: usernameTextEditingController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Color(0XFF292A37)),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                    color: Color(0XFF292A37),
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff6CC784), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  counterText: "",
                  border: OutlineInputBorder(),
                  hintText: "Username",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                obscureText: true,
                maxLength: 13,
                keyboardType: TextInputType.text,
                controller: passwordTextEditingController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password, color: Color(0XFF292A37)),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(
                    color: Color(0XFF292A37),
                    fontSize: 20,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff6CC784), width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  counterText: "",
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff6CC784),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 135)),
                onPressed: () async {
                  // await personController.getUser();
                  // await personController.getUserDetails();
                  getEnrolledUsersController.getEnrolledUsers();
                  // Get.to(() => SingleUserScreen());
                },
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : getMobileFormWidget(context),
        ));
  }
}
