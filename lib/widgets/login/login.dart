import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import "package:provider/provider.dart";
import '../../providers/user_provider.dart';
import '../home/home.dart';
import 'Signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UnderlineInputBorder focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
  );

  UnderlineInputBorder enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey),
  ); //هاللون بطلع قبل الادخال او كتابة اي شي

  InputDecoration decorationFormFieldFN({required String hintText}) {
    return InputDecoration(
      focusedBorder: focusedBorder,
      enabledBorder: enabledBorder,
      hintText: hintText,
    );
  }

  // getLoginFN() async {
  //   if (formKey.currentState!.validate()) {
  //     await Provider.of<UserProvider>(context, listen: false)
  //         .getLoginFN(email: email.text, password: password.text);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LogIn'),
      //   centerTitle: true,
      // ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Image.asset('lib/assets/images/rigester_image/login.png',
                          width: 200),
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'couture'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      const Text('Enter your email and password please !'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: 'Enter your email',
                            labelText: 'email',
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return 'please enter your email';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: 'Enter your password',
                            labelText: 'password',
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(CupertinoIcons.eye),
                            ),
                          ),
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return 'please enter your password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200, top: 15),
                        child: Text('forget password'),
                        // onPressed: () {
                        //           Navigator.pushAndRemoveUntil(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => const Signup()),
                        //               (route) => false);
                        //         }
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            Provider.of<UserProvider>(context, listen: false)
                                .getLoginFN(
                                    email: email.text, password: password.text)
                                .then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()),
                                    (route) => false);
                              } else {
                                print('password not correct');
                              }
                            });
                          }
                        },
                        child: const Text('Log in'),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextButton(
                                child: const Text('Create new account'),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Signup()),
                                      (route) => false);
                                }),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Or login with',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left: 30),
                          //   child: Icon(
                          //     FontAwesomeIcons.google,
                          //     size: 20,
                          //     color: Colors.red,
                          //   ),
                          //  ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
