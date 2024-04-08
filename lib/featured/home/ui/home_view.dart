import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.withOpacity(.1),
      body: SafeArea(
          child: Column(children: [
        const Row(
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 30,
            )
          ],
        ),
        const Text(
          'Mina',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Gallery",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(30))),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: 30,
              itemBuilder: (context, index) {
                return RawMaterialButton(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(_image[index].image),
                              fit: BoxFit.cover)),
                    ),
                    onPressed: () {});
              }),
        ))
      ])),
    );
  }
}

class ImageDetails {
  final String image;

  ImageDetails({required this.image});
}

List<ImageDetails> _image = [
  ImageDetails(image: 'assets/images/img_group_5.png'),
];
