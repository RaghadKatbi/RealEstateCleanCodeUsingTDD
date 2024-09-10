import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/widget/loading.dart';
import 'package:real_estate/feautre/estate/pesntation/details/details_cubit.dart';
import '../widget/diveder.dart';
import '../widget/mucustom_ElevateButton.dart';
import '../widget/mycustom_text.dart';

class EstateDetails extends StatelessWidget {
  const EstateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              if (state is DetailsLoading)
                return LoadingWidget();
              else if (state is DetailsSuccess)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      "https://proengaqar.com/img/estate/${state.estate.estateImage}",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MyCustomText(
                              text: "السعر : ${state.estate.price}",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
                            MyCustomText(
                                text:
                                    "${state.estate.description} \nالطابق : ${state.estate.floor} \n المساحة : ${state.estate.space} \n عدد الغرف : ${state.estate.rooms} \n عدد الحمامات : ${state.estate.bathrooms} \n حالة البناء: ${state.estate.state} \n الإتجاه: ${state.estate.direction}",
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
                              icon: Icons.location_on_outlined,
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
                              text: "نوع الملكية : ${state.estate.status} ",
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
                                icon: Icons.email_outlined,),
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
    );
  }
}
