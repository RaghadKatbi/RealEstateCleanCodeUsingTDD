import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/feautre/estate/pesntation/bloc_estate/estate_cubit.dart';
import 'package:real_estate/my_bottom_nav.dart';

class GridItem extends StatefulWidget {
  final String name, pathImage;

  const GridItem({super.key, required this.name, required this.pathImage});

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MouseRegion(
        onHover: (event) => _handleHover(isHovered),
        onEnter: (event) => _handleHover(true),
        child: GestureDetector(
          onLongPress: () => _handleHover(isHovered),
          onTap: () {
            _handleHover(isHovered);
           context.read<EstateCubit>().getByCity(widget.name);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyBottomNavigationBar(7, widget.name,0),
                ));
          },
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: SizedBox(
                  width: size.width * 0.25,
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: const Color(0xf0d0dae6),
                    elevation: 6,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                          child: Image.network(
                            "https://proengaqar.com/img/city/${widget.pathImage}",
                            height: size.height * 0.12,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 27,
                              fontFamily: 'cairo',
                              color: Color(0xff203e60),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
