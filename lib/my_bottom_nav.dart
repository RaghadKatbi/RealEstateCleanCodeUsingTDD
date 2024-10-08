import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/feautre/REagent/pesentation/pages/RE_agent.dart';
import 'package:real_estate/feautre/city/pesntation/pages/city_page.dart';
import 'package:real_estate/feautre/estate/pesntation/pages/all_estate_page.dart';
import 'package:real_estate/feautre/user_estate/pesntation/bloc_user_estate/user_estate_cubit.dart';
import 'package:real_estate/feautre/user_estate/pesntation/pages/my_estate.dart';
import 'core/widget/my_drawer.dart';
import 'core/widget/mycustom_appbar.dart';
import 'feautre/about_us/pesntation/page/about_us_page.dart';
import 'feautre/contact_us/pesntation/pages/contact_us_pages.dart';
import 'feautre/estate/pesntation/pages/detailse_estate.dart';
import 'feautre/user_estate/pesntation/favEstate/fav_estate_cubit.dart';
import 'feautre/user_estate/pesntation/pages/add_estate.dart';
import 'feautre/user_estate/pesntation/pages/fav_esatate.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final i;
  final String nameCity;
  final int idEstate;

  const MyBottomNavigationBar(this.i, this.nameCity,this.idEstate, {super.key, });

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  late int selectedIndex = widget.i;
  int iconSelect = 0;
  final List<Widget> page = [
    const CityPage(),
    const MyEstatePage(),
    FavEstatePage(),
    ReAgentPage(),
    const AboutUs(),
    const ContactUs(),
  ];
  late Widget newPage = const EstateDetails();

  @override
  void initState() {
    selectedIndex = widget.i;
    iconSelect = selectedIndex;
    if (selectedIndex == 7) {
      iconSelect = 0;
      newPage = AllEstatePage(widget.nameCity);
    } else if (selectedIndex == 8) {
      iconSelect = 0;
      newPage = const EstateDetails();
    } else if (selectedIndex == 9) {
      iconSelect = 1;
      newPage = const AddRealEstate();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<UserEstateCubit>().getAllEstateAddedByUser();
    context.read<FavEstateCubit>().getFavoriteEstate();
    final GlobalKey<ScaffoldState> _sKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _sKey,
        appBar: MyCustomAppBar(
          onClick: () => _sKey.currentState?.openEndDrawer(),
        ),
        endDrawer: Container(
          margin: const EdgeInsets.only(bottom: 400, top: 50),
          child: const Drawer(
            shadowColor: Colors.grey,
            elevation: 6,
            surfaceTintColor: Colors.white,
            width: 160,
            child: MyDrawer(),
          ),
        ),
        body: selectedIndex < 6 ? page[selectedIndex] : newPage,
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            Icon(
              Icons.home_filled,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.add_home_work_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite_sharp,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.people_alt_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.info_outline,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.phone,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: const Color(0xff1a395b),
          buttonBackgroundColor: const Color(0xff1a395b),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 1000),
          index: iconSelect,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              iconSelect = index;
              print(selectedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
