import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/my_textfield.dart';


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
  ];
  String selectedCity = '';
  String selectedRegion = '';
  List<String> neighborhoods = [];
  Map<String, List<String>> regions = {
    'دمشق': ["ميدان", "الشاغور", "المزة", "الميدان", "المزرعة"],
    'حلب': ["الفردوس", "الزهراء", "الشيخ مقصود", "السكري", "الصاخور"]

  };

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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[3],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                textEditingController: _textControllers[0],
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
                style: const TextStyle(fontFamily: 'cairo', color: Colors.black),
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
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          city,
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontFamily: 'cairo', color: Colors.black),
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
                style: const TextStyle(fontFamily: 'cairo', color: Colors.black),
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
                  child: Text('اختر حي',
                    style: TextStyle(fontFamily: 'cairo', color: Colors.grey),textAlign: TextAlign.right,),
                ),
                style: const TextStyle(fontFamily: 'cairo', color: Colors.black),
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
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: ScreenUtil().setWidth(150),
                  height: ScreenUtil().setHeight(50),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                      WidgetStatePropertyAll(Color(0xffd1d1d1)),
                    ),
                    onPressed: () {

                      Navigator.pop(context);


                    },
                    child: const Text(
                      "إرسال",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff0c3c6d),
                        fontFamily: 'changes',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
