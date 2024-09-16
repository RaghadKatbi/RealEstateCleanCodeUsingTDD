import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constance/string.dart';
import 'package:real_estate/core/widget/loading.dart';
import 'package:real_estate/feautre/estate/pesntation/details/details_cubit.dart';
import 'package:real_estate/feautre/user_estate/pesntation/set_favorite/set_favoriate_cubit.dart';
import 'package:real_estate/my_bottom_nav.dart';
import '../widget/diveder.dart';
import '../widget/mucustom_ElevateButton.dart';
import '../widget/mycustom_text.dart';

class EstateDetails extends StatefulWidget {
  const EstateDetails({super.key});

  @override
  State<EstateDetails> createState() => _EstateDetailsState();
}

class _EstateDetailsState extends State<EstateDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          canPop: false,
          onPopInvoked : (didPop){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyBottomNavigationBar(7, "", 0),));
          },
          child: SingleChildScrollView(
            child: BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                if (state is DetailsLoading)
                  return LoadingWidget();
                else if (state is DetailsSuccess)
                  return Wrap(
                    children: [
                      Image.network(
                        "https://proengaqar.com/img/estate/${state.estate.estateImage}",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                    context
                                        .read<SetFavoriateCubit>()
                                        .setFavoriteEstate(state.estate.id);
                                  }, icon: BlocBuilder<SetFavoriateCubit,
                                      SetFavoriateState>(
                                    builder: (context, state) {
                                      return Icon(
                                        state is UserEstateSuccessSetOrUnSet && state.isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: const Color(0xff1a395b),
                                        size: 35,
                                      );
                                    },
                                  )),
                                  MyCustomText(
                                    text: "السعر : ${state.estate.price}",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              MyCustomText(
                                text:
                                    "الغاية : ${state.estate.purpose} , نوع العقار : ${state.estate.type}",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                  color: Colors.grey.shade200,
                                  width: double.infinity,
                                  height: 30,
                                  alignment: Alignment.centerRight,
                                  child: const MyCustomText(
                                    text: "تفاصيل العقار:",
                                    fontSize: 15,
                                  )),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                child: Padding(
                                  padding:
                             EdgeInsets.only(right: 0, top: 8, bottom: 8, left: 60),
                                  child: Text(
                                   " ${state.estate.description}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'chnanges'),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              MyCustomText(
                                    text:
                                        " الطابق : ${state.estate.floor} \n المساحة : ${state.estate.space} \n عدد الغرف : ${state.estate.rooms} \n عدد الحمامات : ${state.estate.bathrooms} \n حالة البناء: ${state.estate.state} \n الإتجاه: ${state.estate.direction}",
                                    fontSize: 15),
                              const SizedBox(
                                height: 15,
                              ),
                              buildDivider(),
                              const SizedBox(
                                height: 15,
                              ),
                              MyCustomText(
                                text: "اتجاه العقار : ${state.estate.location}",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              buildDivider(),
                              const SizedBox(
                                height: 15,
                              ),
                              MyCustomText(
                                text: "موقع العقار : ${state.estate.neighborhood.name}",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              buildDivider(),
                              const SizedBox(
                                height: 15,
                              ),
                              MyCustomText(
                                text: state.estate.buildingRank==1? "الامان : مفحوص من قبل شركة Building Rank ":"الامان :غير مفحوص من قبل شركة Building Rank ",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              buildDivider(),
                              const SizedBox(
                                height: 15,
                              ),
                              MyCustomText(
                                text:
                                    "عدد المشاهدات : ${state.estate.numberShow} ",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              buildDivider(),
                              const SizedBox(
                                height: 15,
                              ),
                              MyCustomText(
                                text: "نوع الملكية : ${state.estate.license} ",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              buildDivider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const MyCustomElevatedButton(
                                    text: "البريد الالكتروني",
                                    icon: Icons.email_outlined,
                                  ),
                                  const MyCustomElevatedButton(
                                    text: "اتصال",
                                    icon: Icons.phone,
                                  ),
                                ],
                              )
                            ]),
                      )
                    ],
                  );
                return Center();
              },
            ),
          ),
        ),
      ),
    );
  }
}
