import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_pemesanan_makanan_kiel2/controller/controller.dart';
import 'package:login_pemesanan_makanan_kiel2/shared/theme_shared.dart';

// ignore: camel_case_types
class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(243, 240, 237, 14),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 222,
              width: 195,
            ),
            const Text(
              "SooBaksoo",
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 236, 75, 0),
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Welcome",
              style: welcomeTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 48,
              width: 283,
              child: TextField(
                  controller: emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Email",
                    labelText: "Email",
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 48,
              width: 283,
              child: TextField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Password",
                      labelText: "Password",
                      suffixIcon: InkWell(
                          onTap: () {
                            //ketika icon di tekan
                          },
                          child: const Icon(
                            CupertinoIcons.lock,
                            size: 30,
                          )))),
            ),
            const SizedBox(
              height: 40,
            ),
            // ignore: sized_box_for_whitespace
            Container(
                height: 48,
                width: 283,
                child: ElevatedButton(
                    onPressed: () {
                      controller.signIn(context, emailTextController.text,
                          passwordTextController.text);
                    },
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Login',
                      style: welcomeTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: primarycolor),
                    ),
                    style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: orencolor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: secondarycolor, width: 3),
                            borderRadius: BorderRadius.circular(33))))),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an Account?"),
                TextButton(
                  onPressed: () {
                    //menampilkan register
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Wrap(
                                children: [
                                  //Menampilkan isi register form
                                  Container(
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 236, 179, 1),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40))),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: defaultMargin),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Register",
                                                      style: welcomeTextStyle,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                                //UserName
                                                controller: controller
                                                    .namaTextController,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  hintText: "Username",
                                                  labelText: "Username",
                                                )),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                                //Email
                                                controller: emailTextController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    hintText: "Email",
                                                    labelText: "Email",
                                                    suffixIcon: InkWell(
                                                        onTap: () {
                                                          //ketika icon di tekan
                                                        },
                                                        child: const Icon(
                                                          CupertinoIcons
                                                              .envelope,
                                                          size: 30,
                                                        )))),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                                //Phone Number
                                                controller: controller
                                                    .nomorTextController,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    hintText: "Phone Number",
                                                    labelText: "Phone Number",
                                                    suffixIcon: InkWell(
                                                        onTap: () {
                                                          //ketika icon di tekan
                                                        },
                                                        child: const Icon(
                                                          CupertinoIcons.phone,
                                                          size: 30,
                                                        )))),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                                //Phone Number
                                                controller:
                                                    passwordTextController,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    hintText: "Password",
                                                    labelText: "Password",
                                                    suffixIcon: InkWell(
                                                        onTap: () {
                                                          //ketika icon di tekan
                                                        },
                                                        child: const Icon(
                                                          CupertinoIcons.lock,
                                                          size: 30,
                                                        )))),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    2 * defaultMargin,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      controller.signUp(
                                                          context,
                                                          emailTextController
                                                              .text,
                                                          passwordTextController
                                                              .text);
                                                    },
                                                    // ignore: sort_child_properties_last
                                                    child: Text(
                                                      'Create Account',
                                                      style: welcomeTextStyle
                                                          .copyWith(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  primarycolor),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            // ignore: deprecated_member_use
                                                            primary: orencolor,
                                                            shape: RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color:
                                                                        secondarycolor,
                                                                    width: 3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            33))))),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        });
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Color.fromARGB(255, 218, 10, 28)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
