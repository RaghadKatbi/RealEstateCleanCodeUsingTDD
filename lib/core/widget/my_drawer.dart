import 'package:flutter/material.dart';
import 'package:real_estate/my_bottom_nav.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1a395b),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          myAnimation(
            page: 0,
            icon: Icons.home,
            text: 'الرئيسية',
          ),
          myAnimation(
            page: 1,
            icon: Icons.add_home_work_outlined,
            text: 'اضف عقارك',
          ),
          myAnimation(
            page: 2,
            icon: Icons.favorite,
            text: 'المفضلة',
            // isHovered: isHovered[0],
          ),
          // const SizedBox(height: 6),
          myAnimation(
            page: 3,
            icon: Icons.people_alt_outlined,
            text: 'الوكلاء العقاريين',
            //isHovered: isHovered[1],
          ),
          myAnimation(
            page: 4,
            icon: Icons.info_outline,
            text: 'من نحن',
            //isHovered: isHovered[1],
          ),
          //const SizedBox(height: 10),
          myAnimation(
            text: "تواصل معنا",
            page: 5,
            icon: Icons.phone,
            //isHovered: isHovered[2],
          ),
        ],
      ),
    );
  }

  Widget myAnimation({
    required String text,
    required int page,
    required IconData icon,
  }) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(Colors.grey),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyBottomNavigationBar(page,"",0),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'change',
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
