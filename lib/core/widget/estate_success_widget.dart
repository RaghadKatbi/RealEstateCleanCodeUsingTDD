import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feautre/estate/pesntation/details/details_cubit.dart';
import '../../feautre/user_estate/pesntation/set_favorite/set_favoriate_cubit.dart';
import '../../my_bottom_nav.dart';

class EstateSuccessWidget extends StatefulWidget {
  final String type;
  final String purpose;
  final String location;
  final String space;
  final String price;
  final String estateImage;
  final int rooms;
  final int bathrooms;
  final String status;
  final int id;
  final String reasone;

  const EstateSuccessWidget(
      {super.key,
      required this.type,
      required this.purpose,
      required this.location,
      required this.space,
      required this.price,
      required this.rooms,
      required this.bathrooms,
      required this.id,
      required this.estateImage,
      required this.status,
      required this.reasone});

  @override
  State<EstateSuccessWidget> createState() => EstateSuccessWidgetState();
}

class EstateSuccessWidgetState extends State<EstateSuccessWidget>
    with TickerProviderStateMixin {
  bool isRailVisible = false;
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late String st="معلق";
  late String image="";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.1).animate(_animationController);
    if (widget.status == "pend") {
      st = "معلق";
      image = "https://proengaqar.com/img/temp/${widget.estateImage}";
    } else if (widget.status == "cancle") {
      st = "مرفوض";
      image = "https://proengaqar.com/img/temp/${widget.estateImage}";
    } else if (widget.status == "accept") {
      st = "مقبول";
      image = "https://proengaqar.com/img/estate/${widget.estateImage}";
    } else if (widget.status == "المزيد من التفاصيل") {
      st = "المزيد من التفاصيل";
      image = "https://proengaqar.com/img/estate/${widget.estateImage}";
    }
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
        onTap: st == "المزيد من التفاصيل" || st == "مقبول"
            ? () {
                context.read<DetailsCubit>().getEstate(widget.id);
                context.read<SetFavoriateCubit>().isFavorite(widget.id);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyBottomNavigationBar(8, "", widget.id),
                    ));
              }
            : () {},
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
                                  image,
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
                                        st,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  widget.type,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontFamily: 'cairo',
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(widget.purpose,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'cairo',
                                    )),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(widget.location,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'cairo',
                                    )),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(widget.price,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontFamily: 'cairo',
                                    ))
                              ],
                            ),
                          ),
                          widget.type != "أرض"
                              ? Container(
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
                                              widget.space,
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
                                              "${widget.rooms}",
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
                                              "${widget.bathrooms}",
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
                              : Container(),
                          widget.reasone != '0'
                              ? Container(
                                  width: double.infinity,
                                  color: Colors.red,
                                  child: Text(
                                    textAlign: TextAlign.right,
                                    "${widget.reasone}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Container()
                        ],
                      )));
            }),
      ),
    );
  }
}
