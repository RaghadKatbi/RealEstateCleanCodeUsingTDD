import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feautre/estate/domain/entity/estate.dart';
import '../../feautre/user_estate/pesntation/bloc_user_estate/user_estate_cubit.dart';
import '../../my_bottom_nav.dart';

class EstateSuccessWidget extends StatefulWidget {
  final Estate estate;
  const EstateSuccessWidget({super.key, required this.estate});

  @override
  State<EstateSuccessWidget> createState() => EstateSuccessWidgetState();
}

class EstateSuccessWidgetState extends State<EstateSuccessWidget>with TickerProviderStateMixin {
  bool isRailVisible = false;
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
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
    return MouseRegion(
      onHover: (_) => _handleHover(isHovered),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyBottomNavigationBar(7, ""),
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
                                  "https://proengaqar.com/img/estate/${widget.estate.estateImage}",
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
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        selectionColor: Colors.blue.shade50,
                                        "المزيد من التفاصيل  ",
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<UserEstateCubit>()
                                          .setFavoriteEstate(
                                              widget.estate.id);
                                      setState(() {
                                        if (isFavorite) {
                                          isFavorite = false;
                                        } else
                                          isFavorite = true;
                                      });
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: const Color(0xff1a395b),
                                      size: 35,
                                    )),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      widget.estate.type,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontFamily: 'cairo',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(widget.estate.purpose,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'cairo',
                                        )),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(widget.estate.location,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'cairo',
                                        )),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(widget.estate.price,
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
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.system_update_alt_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        widget.estate.space,
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
                                        "${widget.estate.rooms}",
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
                                        "${widget.estate.bathrooms}",
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
    );
  }
}
