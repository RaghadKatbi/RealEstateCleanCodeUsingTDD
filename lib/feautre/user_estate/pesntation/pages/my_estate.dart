import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/constance/string.dart';
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
                if (state is UserEstateSuccessMyEstate)
                  return ListView.builder(
                    itemCount: state.estateAddedByUser.length,
                    itemBuilder: (context, index) => MouseRegion(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MyBottomNavigationBar(7, ""),
                                ));
                          },
                          child: Card(
                              color: const Color(0xf0d0dae6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 50,
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            topLeft: Radius.circular(15)),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.network(
                                          "https://proengaqar.com/img/estate/image_122.jpg",
                                          height: 200,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 20,
                                          left: 10,
                                          child: Container(
                                            width: 200,
                                            color: const Color(0xff365271),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text(
                                                selectionColor:
                                                    Colors.blue.shade50,
                                                state.estateAddedByUser[index]
                                                    .status,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'cairo'),
                                                softWrap: true,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          state.estateAddedByUser[index]
                                              .propertyType,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
                                            fontFamily: 'cairo',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                            state.estateAddedByUser[index]
                                                .propertyPurpose,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'cairo',
                                            )),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                            state.estateAddedByUser[index]
                                                .location,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'cairo',
                                            )),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                            "${state.estateAddedByUser[index].price}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                              fontFamily: 'cairo',
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .system_update_alt_outlined,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "${state.estateAddedByUser[index].space}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'cairo',
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.roller_shades_outlined,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "2 Rooms",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'cairo',
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.bathtub_outlined,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                "1 Bathrooms",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'cairo',
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                    ),
                  );
                else if (state is UserEstateLoadingMyEstate) {
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
                builder: (context) => const MyBottomNavigationBar(9, ""),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
