import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:real_estate/core/widget/estate_success_widget.dart';
import 'package:real_estate/feautre/user_estate/pesntation/favEstate/fav_estate_cubit.dart';
import '../../../../core/widget/loading.dart';


class FavEstatePage extends StatefulWidget {
  const FavEstatePage({super.key});

  @override
  State<FavEstatePage> createState() => _FavEstatePageState();
}

class _FavEstatePageState extends State<FavEstatePage> {
  late bool isFavorite = true;

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
              "العقارات المفضلة لديك",
              style:
                  TextStyle(color: pColor, fontSize: 20, fontFamily: 'cairo'),
            ),
          ),
          Expanded(
            child: BlocBuilder<FavEstateCubit, FavEstateState>(
              builder: (context, state) {
                if (state is UserEstateSuccessMyFavEstate) {
                  if (state.favoriteEstate.isEmpty) {
                    return Center(
                      child: Text(
                        "لايوجد عقارات مفضلة سابقاَ",
                        style: TextStyle(
                            color: pColor, fontSize: 20, fontFamily: 'change'),
                      ),
                    );
                  } else
                    return ListView.builder(
                      itemCount: state.favoriteEstate.length,
                      itemBuilder: (context, index) => EstateSuccessWidget(
                        type: state.favoriteEstate[index].type,
                        purpose: state.favoriteEstate[index].purpose,
                        location: state.favoriteEstate[index].location,
                        space: state.favoriteEstate[index].space,
                        price: state.favoriteEstate[index].price,
                        rooms: state.favoriteEstate[index].room,
                        bathrooms: state.favoriteEstate[index].bathroom,
                        id: state.favoriteEstate[index].id,
                        estateImage: state.favoriteEstate[index].estateImage,
                        status: 'المزيد من التفاصيل', reasone: '0',
                      ),
                    );
                } else if (state is UserEstateLoadingMyFavEstate) {
                  return LoadingWidget();
                }
                return Text("حدث خطأ ما ");
              },
            ),
          )
        ],
      ),
    );
  }
}
