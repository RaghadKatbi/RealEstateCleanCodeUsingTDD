import 'package:flutter/material.dart';
class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onClick;

  const MyCustomAppBar({
    super.key,
   required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff1a395b),
              Color(0xffd6e0eb),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
        ),
        Positioned(
          top: size.height*0.008,
          left: size.width*0.02,
          child: Image.asset(
            "asset/images/Artboard.png",
            width: 120,
          ),
        ),
        Positioned(
          top: 15,
          right: size.width*0.05,
          child:IconButton(onPressed:()=> onClick(),icon: const Icon(color: Colors.white,Icons.dehaze_outlined),),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
