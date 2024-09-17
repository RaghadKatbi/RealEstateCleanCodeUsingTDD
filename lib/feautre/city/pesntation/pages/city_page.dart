import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/widget/loading.dart';
import 'package:real_estate/feautre/city/pesntation/city_bloc/city_cubit.dart';

import '../../../../core/widget/header_screen.dart';
import '../widget/grid_item.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  child: BlocBuilder<CityCubit, CityState>(
                    builder: (context, state) {
                      if (state is CityLoading) {
                        return const LoadingWidget();
                      } else if (state is CitySuccess) {
                        print(state.city);
                        return GridView.builder(
                          itemCount: state.city.length,
                          padding: const EdgeInsets.all(12),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GridItem(
                              name: state.city[index].name,
                              pathImage: state.city[index].cityImage,
                            );
                          },
                        );
                      } else if (state is CityFailure) {
                        return Center(child: Text(state.message));
                      }
                      return Text("++++++++++++++++");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}