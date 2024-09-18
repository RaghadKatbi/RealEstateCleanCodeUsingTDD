import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/feautre/user_estate/pesntation/add_estate/add_esatate_cubit.dart';
import '../../../../core/widget/loading.dart';
import '../../../../core/widget/my_textfield.dart';
import '../../../../core/widget/show_message.dart';

import '../../../../my_bottom_nav.dart';
import '../../../city/domain/entity/city.dart';
import '../../../city/domain/entity/neighborhood.dart';
import '../../../city/domain/entity/region.dart';
import '../../../city/pesntation/city_bloc/city_cubit.dart';
import '../../../city/pesntation/neighborhood_bloc/neighborhood_cubit.dart';
import '../../../city/pesntation/region_bloc/region_cubit.dart';
import '../../data/model/estate_added_by_user_model.dart';

class AddRealEstate extends StatefulWidget {
  const AddRealEstate({super.key});

  @override
  State<AddRealEstate> createState() => _AddRealEstateState();
}

class _AddRealEstateState extends State<AddRealEstate> {
  final _textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final ImagePicker _picker = ImagePicker();
  late File image = File("");
  late File video = File("");

  Future<void> chooseImage() async {
    var chooseImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(chooseImage!.path);
    });
  }

  Future<void> chooseVideo() async {
    var chooseImage = await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      video = File(chooseImage!.path);
    });
  }

  String? selectedCity;

  String? selectedRegion;

  String? selectedNeighborhood;
  int neighborhoodId=0;
  late int selectId = 0;

  List<DropdownMenuItem<String>> getCityDropdownItems(List<City> cities) {
    return cities.map((city) {
      return DropdownMenuItem<String>(
        value: city.name,
        child: Text(city.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getRegionDropdownItems(List<Region> regions) {
    return regions.map((region) {
      return DropdownMenuItem<String>(
        value: region.name,
        child: Text(region.name),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> getNeighborhoodDropdownItems(
      List<Neighborhood> neighborhoods) {
    return neighborhoods.map((neighborhood) {
      return DropdownMenuItem<String>(
        value: neighborhood.name,
        child: Text(neighborhood.name),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked : (didPop){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyBottomNavigationBar(1, "", 0),));
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 20),
                  child: Text(
                    "أضف عقارك الجديد",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'cairo',
                      color: Color(0xff365271),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "نوع العقار",
                    icon: Icons.real_estate_agent_outlined,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[0],
                    enable: false,
                    validator:  (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "الغاية",
                    icon: Icons.account_balance,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 20,
                    textEditingController: _textControllers[1],
                    enable: false,
                    validator:  (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "عدد الغرف",
                    icon: Icons.meeting_room_outlined,
                    textInputType: TextInputType.number,
                    maxLine: 1,
                    maxLength: 6,
                    textEditingController: _textControllers[2],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "عدد الحمامات",
                    icon: Icons.bathroom_outlined,
                    textInputType: TextInputType.number,
                    maxLine: 1,
                    maxLength: 6,
                    textEditingController: _textControllers[3],
                    enable: false,
                    validator:  (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "السعر",
                    icon: Icons.money,
                    textInputType: TextInputType.visiblePassword,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[4],
                    enable: false,
                    validator:  (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "حالة البناء",
                    icon: Icons.gpp_good_outlined,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[5],
                    enable: false,
                    validator:  (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "مساحة البناء",
                    icon: Icons.space_bar,
                    textInputType: TextInputType.visiblePassword,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[6],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "الوجهة",
                    icon: Icons.north_west_outlined,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[7],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "الرخصة",
                    icon: Icons.verified_outlined,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[8],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "الطابق",
                    icon: Icons.stairs_outlined,
                    textInputType: TextInputType.visiblePassword,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[9],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "الوصف",
                    icon: Icons.more_outlined,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[10],
                    enable: false,
                    validator: (value){
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "سعر المتر",
                    icon: Icons.money,
                    textInputType: TextInputType.visiblePassword,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[11],
                    enable: false,
                    validator: (value) {
                  },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "عرض الشارع",
                    icon: Icons.straight_outlined,
                    textInputType: TextInputType.visiblePassword,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[12],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "اتجاه المنزل",
                    icon: Icons.directions,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[13],
                    enable: false,
                    validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'الرجاء ملئ الحقل';
                    return null;
                  },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "مميزات العقار",
                    icon: Icons.star,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 40,
                    textEditingController: _textControllers[14],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),     Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: myTextFormField(
                    hintText: "العنوان بالتفصيل",
                    icon: Icons.more_horiz,
                    textInputType: TextInputType.text,
                    maxLine: 1,
                    maxLength: 120,
                    textEditingController: _textControllers[15],
                    enable: false,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'الرجاء ملئ الحقل';
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: BlocBuilder<NeighborhoodCubit, NeighborhoodState>(
                          builder: (context, state) {
                            return DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('اختر حي'),
                              value: selectedNeighborhood,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedNeighborhood = newValue;
                              state is  NeighborhoodSuccess? neighborhoodId=  state.neighborhood
                                      .firstWhere((region) =>
                                  region.name == selectedNeighborhood)
                                      .id
                                  : 0;
                              print(neighborhoodId);
                                });
                              },
                              items: selectedRegion != null &&
                                      state is NeighborhoodSuccess
                                  ? getNeighborhoodDropdownItems(
                                      state.neighborhood)
                                  : [],
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: BlocBuilder<RegionCubit, RegionState>(
                          builder: (context, state) {
                            return DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('اختر منطقة'),
                              value: selectedRegion,
                              onChanged: (String? newValue) {
                                int regionId = 0;
                                setState(() {
                                  selectedRegion = newValue;
                                  selectedNeighborhood = null;
                                  regionId = state is RegionSuccess
                                      ? state.region
                                          .firstWhere((region) =>
                                              region.name == selectedRegion)
                                          .id
                                      : 0;
                                });
                                context
                                    .read<NeighborhoodCubit>()
                                    .getAllNeighborhood(regionId);
                              },
                              items:
                                  selectedCity != null && state is RegionSuccess
                                      ? getRegionDropdownItems(state.region)
                                      : [],
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: BlocBuilder<CityCubit, CityState>(
                          builder: (context, state) {
                            return DropdownButton<String>(
                              isExpanded: true,
                              hint: Text('اختر مدينة'),
                              value: selectedCity,
                              onChanged: (String? newValue) {
                                int cityId = 0;
                                setState(() {
                                  selectedCity = newValue;
                                  cityId = state is CitySuccess
                                      ? state.city
                                          .firstWhere(
                                              (city) => city.name == selectedCity)
                                          .id
                                      : 0;
                                  selectedRegion = null;
                                  selectedNeighborhood = null;
                                });
                                context.read<RegionCubit>().getAllRegion(cityId);
                              },
                              items: state is CitySuccess
                                  ? getCityDropdownItems(state.city)
                                  : [],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          chooseImage();
                        },
                        child: Text("Choose photo")),
                    ElevatedButton(
                        onPressed: () {
                          chooseVideo();
                        },
                        child: Text("Choose video")),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 150,
                        height: 50,
                        child: SizedBox(
                            width: 180,
                            // Use ScreenUtil for responsive width
                            height: 50,
                            // Use ScreenUtil for responsive height
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Color(0xffd1d1d1))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final EstateAddedByUserModel estateAddedByUser =
                                      EstateAddedByUserModel(
                                          image: "image",
                                          video: "video",
                                          id: 0,
                                          propertyType: _textControllers[0].text,
                                          propertyPurpose:
                                              _textControllers[1].text,
                                          rooms:
                                              int.parse(_textControllers[2].text),
                                          bathrooms:
                                              int.parse(_textControllers[3].text),
                                          price: _textControllers[4].text,
                                          space: _textControllers[6].text,
                                          direction: _textControllers[7].text,
                                          license: _textControllers[8].text,
                                          floor: _textControllers[9].text,
                                          description: _textControllers[10].text,
                                          meterPrice: _textControllers[11].text,
                                          streetWidth: _textControllers[12].text,
                                          location: _textControllers[13].text,
                                          features: _textControllers[14].text,
                                          neighborhoodId: neighborhoodId,
                                          userId: 1,
                                          buildingRank: 0,
                                          status: _textControllers[5].text,
                                          note: _textControllers[15].text,
                                          updatedAt: "",
                                          createdAt: "",
                                          reason: "0",
                                          detaillsAddress:_textControllers[15].text,);
                                  context.read<AddEsatateCubit>().addMyEstate(
                                      estateAddedByUser, image, video);
                                }
                                print(_textControllers[0]);
                                print(image);
                                print(video);
                              },
                              child:
                                  BlocBuilder<AddEsatateCubit, AddEsatateState>(
                                builder: (context, state) {
                                  if (state is UserEstateLoadingMyAddEstate) {
                                    return const LoadingWidget();
                                  } else if (state
                                      is UserEstateSuccessMyAddEstate) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((timeStamp) {});
                                  } else if (state
                                      is UserEstateFailureMyAddEstate) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      showMessageDialog(
                                          context, state.message, "خطأ");
                                    });
                                  }
                                  return Text(
                                    "ارسال",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: const Color(0xff0c3c6d),
                                      fontFamily: 'changes',
                                    ),
                                  );
                                },
                              ),
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
