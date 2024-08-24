import 'package:flutter/material.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widget/my_textfield.dart';


class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            alwaysIncludeSemantics: true,
            opacity: 0.1,
            child: Image.asset(
              "asset/images/img_2.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          "asset/images/img_2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 50,
                    child: Text(
                      "صفحة التواصل",
                      style: TextStyle(
                        //backgroundColor: Color(0xff365271),
                          color: Color(0xff365271),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'change',
                          fontSize: 20),
                    ),
                  ),
                ]),
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  child: Text(
                    "ابق على تواصل معنا",
                    style: TextStyle(
                      //backgroundColor: Color(0xff365271),
                        color: Color(0xff365271),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'change',
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 30, 18, 18),
                  child: myTextFormField(
                      hintText: "الاسم ",
                      icon: Icons.person_2,
                      textInputType: TextInputType.name,
                      maxLine: 1,
                      maxLength: 10,
                      textEditingController: name,
                      enable: false,
                      validator: (value) {
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                  child: myTextFormField(
                      hintText: "رقم الهاتف ",
                      icon: Icons.email,
                      textInputType: TextInputType.phone,
                      maxLine: 1,
                      maxLength: 10,
                      textEditingController: phone,
                      enable: true,
                      validator: (value) {
                        return null;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 18),
                  child: myTextFormField(
                      hintText: "\n الرسالة ",
                      icon: Icons.message,
                      textInputType: TextInputType.name,
                      maxLine: 3,
                      maxLength: 10,
                      textEditingController: message,
                      enable: false,
                      validator: (value) {
                        return null;
                      }),
                ),
                SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                            WidgetStatePropertyAll(Color(0xffd1d1d1))),
                        onPressed: () {

                        },
                        child: const Text(
                          "إرسال",
                          style: TextStyle(
                              fontSize: 17, color: Color(0xff0c3c6d)),
                        ))),
                Card(
                  elevation: 8,
                  margin: const EdgeInsets.all(18),
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "0966333221",
                              style: TextStyle(fontFamily: 'change'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.phone),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("engabdulaziz@yahoo.com"),
                            Icon(Icons.email),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text(
                                 location,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: 'change'),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      final Uri _url = Uri.parse(locationGoogleMap);
                                      if (!await launchUrl(_url)) {
                                        throw Exception(
                                            'Could not launch $_url');
                                      }
                                    },
                                    child: const Text(
                                      "اضغط لاستعراض الموقع",
                                      style: TextStyle(
                                          fontFamily: 'change',
                                          color: Color(0xff0c3c6d),
                                          fontWeight: FontWeight.w900),
                                    ))
                              ],
                            ),
                            const Icon(Icons.location_pin),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}