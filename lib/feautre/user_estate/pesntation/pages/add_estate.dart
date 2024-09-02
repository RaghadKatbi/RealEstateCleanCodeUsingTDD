import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/feautre/user_estate/pesntation/bloc_user_estate/user_estate_cubit.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/widget/loading.dart';
import '../../../../core/widget/my_textfield.dart';
import '../../../../core/widget/show_message.dart';
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
  ];
  bool isVideo = false;

  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  late XFile video, image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  final TextEditingController limitController = TextEditingController();
  String selectedCity = '';
  String selectedRegion = '';
  List<String> neighborhoods = [];
  Map<String, List<String>> regions = {
    'دمشق': ["ميدان", "الشاغور", "المزة", "الميدان", "المزرعة"],
    'حلب': ["الفردوس", "الزهراء", "الشيخ مقصود", "السكري", "الصاخور"]
  };

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                maxLength: 6,
                textEditingController: _textControllers[0],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "الغاية",
                icon: Icons.account_balance,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[1],
                enable: false,
                validator: (value) => null,
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
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "عدد الحمامات",
                icon: Icons.bathtub_outlined,
                textInputType: TextInputType.number,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[3],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "السعر",
                icon: Icons.real_estate_agent_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[4],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "حالة البناء",
                icon: Icons.gpp_good_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[5],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "مساحة البناء",
                icon: Icons.electric_meter_outlined,
                textInputType: TextInputType.number,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[6],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "الوجهة",
                icon: Icons.north_west_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[7],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "الرخصة",
                icon: Icons.verified_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[8],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "الطابق",
                icon: Icons.flood_rounded,
                textInputType: TextInputType.number,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[9],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "الوصف",
                icon: Icons.more_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[10],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "سعر المتر",
                icon: Icons.price_change_outlined,
                textInputType: TextInputType.number,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[11],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "عرض الشارع",
                icon: Icons.straight_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[12],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "اتجاه المنزل",
                icon: Icons.home_outlined,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[13],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: myTextFormField(
                hintText: "مميزات العقار",
                icon: Icons.star,
                textInputType: TextInputType.text,
                maxLine: 1,
                maxLength: 6,
                textEditingController: _textControllers[14],
                enable: false,
                validator: (value) => null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCity.isEmpty ? null : selectedCity,
                hint: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'اختر مدينة',
                    style: TextStyle(fontFamily: 'cairo', color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ),
                style:
                    const TextStyle(fontFamily: 'cairo', color: Colors.black),
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                items: regions.keys.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blueGrey.shade50,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          city,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              fontFamily: 'cairo', color: Colors.black),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                    selectedRegion = '';
                    neighborhoods = [];
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedRegion.isEmpty ? null : selectedRegion,
                hint: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'اختر منطقة',
                    style: TextStyle(fontFamily: 'cairo', color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ),
                style:
                    const TextStyle(fontFamily: 'cairo', color: Colors.black),
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                items: selectedCity.isEmpty
                    ? []
                    : regions[selectedCity]!.map((String region) {
                        return DropdownMenuItem<String>(
                          value: region,
                          child: Text(region),
                        );
                      }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRegion = value!;
                    // قم بتحديث الأحياء في هذه المنطقة
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCity.isEmpty ? null : selectedCity,
                hint: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'اختر حي',
                    style: TextStyle(fontFamily: 'cairo', color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ),
                style:
                    const TextStyle(fontFamily: 'cairo', color: Colors.black),
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                items: regions.keys.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blueGrey.shade50,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          city,
                          textAlign: TextAlign.right, // تحديد موقع النص
                          style: const TextStyle(
                              fontFamily: 'cairo', color: Colors.black),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                    selectedRegion = '';
                    neighborhoods = [];
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      isVideo = false;
                      _onImageButtonPressed(ImageSource.gallery,
                          context: context);
                    },
                    child: Text("Choose photo")),
                ElevatedButton(
                    onPressed: () {
                      isVideo = true;
                      _onImageButtonPressed(ImageSource.gallery,
                          context: context);
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
                            // if (_formKey.currentState!.validate()) {
                            final EstateAddedByUserModel estateAddedByUser =
                                EstateAddedByUserModel(
                                    image: "image",
                                    video: "video",
                                    id: 0,
                                    propertyType: _textControllers[0].text,
                                    propertyPurpose: _textControllers[1].text,
                                    rooms: int.parse(_textControllers[3].text),
                                    bathrooms:
                                        int.parse(_textControllers[4].text),
                                    price: _textControllers[5].text,
                                    space: _textControllers[7].text,
                                    direction: _textControllers[8].text,
                                    license: _textControllers[6].text,
                                    floor: _textControllers[9].text,
                                    description: _textControllers[10].text,
                                    meterPrice: _textControllers[11].text,
                                    streetWidth: _textControllers[12].text,
                                    location: _textControllers[13].text,
                                    features: "_textControllers[14].text",
                                    neighborhoodId: 1,
                                    userId: 1,
                                    buildingRank: 0,
                                    status: "",
                                    note: "",
                                    updatedAt: "",
                                    createdAt: "",
                                    reason: 0,
                                    detaillsAddress: '');
                            context
                                .read<UserEstateCubit>()
                                .addMyEstate(estateAddedByUser);
                            // }
                          },
                          child: BlocBuilder<UserEstateCubit, UserEstateState>(
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
    );
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.networkUrl(Uri.parse(file.path));
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (context.mounted) {
      if (isVideo) {
        final XFile? file = await _picker.pickVideo(
            source: source, maxDuration: const Duration(seconds: 10));
        await _playVideo(file);
        video = file!;
      } else {
        final XFile? file = await _picker.pickImage(
          source: source,
        );
        image = file!;
      }
    }
    return null;
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }
}
