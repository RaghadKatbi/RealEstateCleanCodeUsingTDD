import 'package:flutter/material.dart';
class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  SizedBox(
      width: double.infinity,
      height: size.height*0.28,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)),
            child: SizedBox(
              width: double.infinity,
              height: size.height*0.25,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "asset/images/img_2.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
           Positioned(
            right: size.width*0.05,
            top: size.height*0.07,
            child: const Column(
              children: [
                Text(
                  "المحترف لتطوير وتسويق العقارات",
                  style: TextStyle(
                      color: Color(0xff365271),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo',
                      fontSize: 20),
                ),
                SizedBox(height: 4,),
                Text(
                  "بوابتك إلى العقارات الأكثر ملائمة",
                  style: TextStyle(
                      color: Color(0xff657c90),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cairo',
                      fontSize: 17),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
