import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mygallery/core/service/api_service.dart';
import 'package:mygallery/featured/home/ui/home_view.dart';
import 'package:mygallery/featured/login/ui/widget/custom_buttom.dart';
import 'package:mygallery/featured/login/ui/widget/custom_text_feild.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            height: size.height,
            child: Image.asset('assets/images/log in (1).png'),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const Positioned(
            top: 170,
            left: 100,
            child: SizedBox(
              width: 174,
              child: Text(
                "My  Gellary ",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
              top: 300,
              bottom: 200,
              left: 20,
              right: 20,
              child: Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(.5)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppTextFormField(
                      controller: _email,
                      hintText: 'User Name',
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppTextFormField(
                      controller: _password,
                      hintText: 'Password',
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomElevatedButton(
                        onPressed: () {
                          ApiService().login();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeView();
                          }));
                        },
                        buttonTextStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        buttonStyle: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 57, 121, 231))),
                        text: "Submit",
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
