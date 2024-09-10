import 'package:flutter/material.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCustomElevatedButton extends StatelessWidget {
  final String text;
  final IconData? icon;

  const MyCustomElevatedButton({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: icon != null
            ? ElevatedButton.icon(
          icon: Icon(icon) ,
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
              foregroundColor: Colors.white,
              backgroundColor: pColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          onPressed: ()async {
            if(text=="اتصال")
              {
                final Uri _url =
                Uri ( scheme: 'tel',
                  path: '0966333221',);
                if (!await launchUrl(_url)) {
            throw Exception(
            'Could not launch $_url');
            }
              }
            else{
              final Uri _url =
             Uri ( scheme: 'mailto',
              path: 'info@proengaqar.com',);
              if (!await launchUrl(_url)) {
                throw Exception(
                    'Could not launch $_url');
              }
            }
          },
          label: Text(text),
        ) : ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
              foregroundColor: Colors.white,
              backgroundColor: pColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          onPressed: () {},
          label: Text(text),
        ),
      ),
    );
  }
}
