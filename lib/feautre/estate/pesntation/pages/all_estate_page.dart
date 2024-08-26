import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/widget/loading.dart';
import 'package:real_estate/feautre/estate/pesntation/bloc_estate/estate_cubit.dart';

import '../../../../core/widget/header_screen.dart';
import '../../../../my_bottom_nav.dart';

class AllEstatePage extends StatefulWidget {
  final nameCity;

  const AllEstatePage(
    this.nameCity, {
    super.key,
  });

  @override
  State<AllEstatePage> createState() => _AllEstatePageState();
}

class _AllEstatePageState extends State<AllEstatePage>
    with TickerProviderStateMixin {
  final List type = [
    "الكل",
    "شقة",
    "فيلا",
    "أرض",
    "محل",
    "مكتب",
    "استراحة (شاليه _ مزرعة)",
    "غرفة"
  ];
  int isSelected = 0;
  bool isRailVisible = false;
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool hover) {
    setState(() {
      isHovered = !hover;
      if (isHovered) {
        _animationController.forward();
      }
      Future.delayed(const Duration(milliseconds: 300), () {
        _animationController.reverse();
      });
    });
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: MyCustomAppBar(preferredHeight: 100,),
        body: Column(
          children: [
            const HeaderScreen(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  reverse: true,
                  itemCount: type.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                          print(isSelected);
                        });
                        _showBottomSheet();
                      },
                      child: Container(
                        width: index == 6 ? 190 : 60,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: index != isSelected
                                ? Colors.blueGrey.shade100
                                : const Color(0xff365271)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              type[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: index == isSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'changes',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<EstateCubit, EstateState>(
                builder: (context, state) {
                  if(state is EstateSuccess)
                  return ListView.builder(
                    itemCount: state.estate.length,
                    itemBuilder: (context, index) => MouseRegion(
                      onHover: (_) => _handleHover(isHovered),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyBottomNavigationBar(7, ""),
                              ));
                        },
                        child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: Card(
                                      color: const Color(0xf0d0dae6),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 50,
                                      margin: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        topLeft:
                                                            Radius.circular(
                                                                15)),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.network(
                                                  state.estate[index].estateImage,
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
                                                    color:
                                                        const Color(0xff365271),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Text(
                                                        selectionColor:
                                                            Colors.blue.shade50,
                                                        "المزيد من التفاصيل  ",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'cairo'),
                                                        softWrap: true,
                                                        overflow:
                                                            TextOverflow.fade,
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        if (isFavorite)
                                                          isFavorite = false;
                                                        else
                                                          isFavorite = true;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      isFavorite
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: const Color(
                                                          0xff1a395b),
                                                      size: 35,
                                                    )),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                     state.estate[index].type,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                        fontFamily: 'cairo',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(state.estate[index].purpose,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'cairo',
                                                        )),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(state.estate[index].location,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'cairo',
                                                        )),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(state.estate[index].price,
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.blue,
                                                          fontFamily: 'cairo',
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black,
                                            child:  Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        state.estate[index].space,
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
                                                        Icons
                                                            .roller_shades_outlined,
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
                                      )));
                            }),
                      ),
                    ),
                  );
                  else if(state is EstateLoading)
                    {
                      return LoadingWidget();
                    }
                  return Text("حدث خطأ ما ");
                },
              ),
            )
          ],
        ),
        //bottomNavigationBar: const MyBottomNavigationBar(),
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
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all<Color>(Colors.grey),
                ),
                child: const Text(
                  'بيع',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'changes', fontSize: 25),
                ),
                onPressed: () {
                  // تنفيذ الإجراء المطلوب عند النقر على "شقة"
                  Navigator.pop(context); // إغلاق BottomSheet بعد النقر
                },
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all<Color>(Colors.grey),
                ),
                child: const Text(
                  'إجار',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'changes', fontSize: 25),
                ),
                onPressed: () {
                  // تنفيذ الإجراء المطلوب عند النقر على "إيجار"
                  Navigator.pop(context); // إغلاق BottomSheet بعد النقر
                },
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all<Color>(Colors.grey),
                ),
                child: const Text(
                  'رهن',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'changes', fontSize: 25),
                ),
                onPressed: () {
                  // تنفيذ الإجراء المطلوب عند النقر على "رهن"
                  Navigator.pop(context); // إغلاق BottomSheet بعد النقر
                },
              ),
            ],
          )),
        );
      },
    );
  }
}
