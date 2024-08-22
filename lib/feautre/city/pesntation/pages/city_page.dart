import 'package:flutter/material.dart';
import 'package:real_estate/core/widget/mycustom_appbar.dart';

import '../../../../core/widget/header_screen.dart';
import '../widget/grid_item.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        onClick: () {},
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              "asset/images/img_2.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const HeaderScreen(),
              const Padding(
                padding: EdgeInsets.only(right: 28, top: 0),
                child: Text(
                  "اختيار مدينة",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 28, top: 8),
                child: Text(
                  "البحث عن العقارات داخل المدينة",
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'changes',
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: 9,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return const GridItem(
                    name: "no name",
                    pathImage: '',
                  );
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}
