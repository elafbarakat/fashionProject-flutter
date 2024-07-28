//import 'package:fashionProject/widgets/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../home/home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('lib/assets/images/rigester_image/login.png',
                          width: 200),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text('Enter your email and password please !'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1),
                              ),
                              hintText: 'Name',
                              labelText: 'Name'),
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return 'please enter your name';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: 'Enter your email',
                            labelText: 'Email',
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
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: phone,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: 'Enter your phone number please ',
                            labelText: 'Phone',
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return 'please enter your Phone';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(CupertinoIcons.eye),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return 'please enter your Password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: passwordconfirm,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                            hintText: 'Enter your password',
                            labelText: 'PasswordConfirm',
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(CupertinoIcons.eye),
                            ),
                          ),
                          validator: (val) {
                            if (val!.trim().isEmpty) {
                              return 'please enter your PasswordConfirm';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            //  if (passwordconfirm.text != password.text) {

                            Provider.of<UserProvider>(context, listen: false)
                                .getSignupFN(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text,
                                    password: password.text)
                                .then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()),
                                    (route) => false);
                              } else {
                                print('ttt');
                              }
                            });
                          }
                        },
                        child: const SizedBox(
                          width: 60,
                          child: Text('Sign in'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()),
                              (route) => false);
                        },
                        child: const Text('Already have account'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Text(
                              'Or login with',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Icon(
                              Icons.facebook,
                              // size: 25,
                              color: Colors.blue,
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left: 40),
                          //   child: Icon(
                          //     FontAwesomeIcons.google,
                          //     size: 20,
                          //     color: Colors.red,
                          //   ),
                          // ),
                        ],
                      )
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
