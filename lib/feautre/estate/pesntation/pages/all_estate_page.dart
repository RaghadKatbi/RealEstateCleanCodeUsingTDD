import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/widget/loading.dart';
import '../../../../core/widget/estate_success_widget.dart';
import '../../../../core/widget/header_screen.dart';
import '../../../../my_bottom_nav.dart';
import '../bloc_estate/estate_cubit.dart';

class AllEstatePage extends StatefulWidget {
  final String nameCity;

  const AllEstatePage(this.nameCity, {Key? key}) : super(key: key);

  @override
  State<AllEstatePage> createState() => _AllEstatePageState();
}

class _AllEstatePageState extends State<AllEstatePage> {
  final List<String> type = [
    "شقة",
    "فيلا",
    "أرض",
    "محل",
    "مكتب",
    "استراحة (شاليه _ مزرعة)",
    "غرفة",
  ];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyBottomNavigationBar(0, "", 0),
                ));
          },
          child: Column(
            children: [
              const HeaderScreen(),
              _buildTypeSelector(),
              _buildEstateList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ListView.builder(
          reverse: true,
          itemCount: type.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = index;
                });
                // isSelected == 0
                //     ? context.read<EstateCubit>().getAllEstate(widget.nameCity)
                _showBottomSheet();
              },
              child: _buildTypeButton(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeButton(int index) {
    return Container(
      width: index == 5 ? 190 : 60,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: index != isSelected
            ? Colors.blueGrey.shade100
            : const Color(0xff365271),
      ),
      child: Center(
        child: Text(
          type[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: index == isSelected ? Colors.white : Colors.black,
            fontFamily: 'changes',
          ),
        ),
      ),
    );
  }

  Widget _buildEstateList() {
    return Expanded(
      child: BlocBuilder<EstateCubit, EstateState>(
        builder: (context, state) {
          if (state is EstateLoading) {
            return LoadingWidget();
          } else if (state is EstateSuccess) {
            if (state.estate.isEmpty) {
              return Center(child: Text("لا توجد نتائج مطابقة للبحث"));
            }
            return ListView.builder(
              itemCount: state.estate.length,
              itemBuilder: (context, index) => EstateSuccessWidget(
                type: state.estate[index].type,
                bathrooms: state.estate[index].bathrooms ?? 0,
                estateImage: state.estate[index].estateImage,
                id: state.estate[index].id,
                location: state.estate[index].location,
                price: state.estate[index].price,
                purpose: state.estate[index].purpose,
                rooms: state.estate[index].rooms ?? 0,
                space: state.estate[index].space,
                status: 'المزيد من التفاصيل',
              ),
            );
          }
          return Center(child: Text("حدث خطأ ما "));
        },
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Color(0xff365271),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildBottomSheetButton('بيع'),
                _buildBottomSheetButton('ايجار'),
                _buildBottomSheetButton('رهن'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetButton(String action) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(Colors.grey),
      ),
      child: Text(
        action,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'changes',
          fontSize: 25,
        ),
      ),
      onPressed: () {
        context
            .read<EstateCubit>()
            .getFilterEstate(type[isSelected], action, widget.nameCity);
        Navigator.pop(context);
      },
    );
  }
}
