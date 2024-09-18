import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:real_estate/core/widget/estate_success_widget.dart';
import 'package:real_estate/feautre/city/pesntation/city_bloc/city_cubit.dart';
import 'package:real_estate/feautre/user_estate/pesntation/bloc_user_estate/user_estate_cubit.dart';

import '../../../../core/widget/loading.dart';
import '../../../../my_bottom_nav.dart';

class MyEstatePage extends StatefulWidget {
  const MyEstatePage({super.key});

  @override
  State<MyEstatePage> createState() => _MyEstatePageState();
}

class _MyEstatePageState extends State<MyEstatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 110.0, top: 20, bottom: 20),
            child: Text(
              textAlign: TextAlign.right,
              "العقارات التي اضفتها مسبقا",
              style: TextStyle(
                  color: Color(0xff365271), fontSize: 20, fontFamily: 'cairo'),
            ),
          ),
          Expanded(
            child: BlocBuilder<UserEstateCubit, UserEstateState>(
              builder: (context, state) {
                if (state is UserEstateSuccessMyEstate) {
                  if (state.estateAddedByUser.isEmpty)
                    return Center(
                      child: Text(
                        "لا يوجد عقارات مضافة سابقاَ لك.",
                        style: TextStyle(
                            color: pColor, fontSize: 20, fontFamily: 'change'),
                      ),
                    );
                  else
                    return ListView.builder(
                      itemCount: state.estateAddedByUser.length,
                      itemBuilder: (context, index) => EstateSuccessWidget(
                        type: state.estateAddedByUser[index].propertyType,
                        purpose: state.estateAddedByUser[index].propertyPurpose,
                        location: state.estateAddedByUser[index].location,
                        space: state.estateAddedByUser[index].space,
                        price: state.estateAddedByUser[index].price,
                        rooms: state.estateAddedByUser[index].rooms,
                        bathrooms: state.estateAddedByUser[index].bathrooms,
                        id: state.estateAddedByUser[index].id,
                        estateImage: state.estateAddedByUser[index].image,
                        status: state.estateAddedByUser[index].status,
                        reasone: state.estateAddedByUser[index].reason ?? "0",
                      ),
                    );
                } else if (state is UserEstateLoadingMyEstate) {
                  return LoadingWidget();
                }
                return Text("حدث خطأ ما ");
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: pColor,
        onPressed: () {
          context.read<CityCubit>().getAllCity();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyBottomNavigationBar(9, "", 0),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
