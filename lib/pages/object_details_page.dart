import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_mobile/components/remove_dialog.dart';
import 'package:trabalho_mobile/entities/object.dart';
import '../entities/group.dart';
import '../entities/user.dart';
import '../themes/theme.dart';
import 'menu_lateral.dart';

class ObjectDetailsPage extends StatefulWidget {
  final User currUser;
  final Group userGroup;
  final Object currObject;
  final void Function(Object) removeObject;

  const ObjectDetailsPage({
    super.key,
    required this.currObject,
    required this.currUser,
    required this.userGroup,
    required this.removeObject,
  });

  @override
  ObjectDetailsPageState createState() => ObjectDetailsPageState();
}

class ObjectDetailsPageState extends State<ObjectDetailsPage> {
  int _currCarouselIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  void _showRemoveObjectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RemoveDialog(
          title: 'Excluir Objeto',
          subTitle: 'Deseja realmente excluir o objeto selecionado?',
          handleRemove: () {
            Navigator.of(context).pop();
            setState(() {
              widget.removeObject(widget.currObject);
              Navigator.of(context).pop();
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isObjectOwner = widget.currUser.isObjectOwner(widget.currObject.id);

    ButtonStyle removeButtonStyle = ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(AppTheme.supportErrorDark),
      foregroundColor: WidgetStateProperty.all<Color>(AppTheme.neutralLightest),
      padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Scaffold(
      drawer: AppDrawer(loggedUser: widget.currUser, userGroup: widget.userGroup,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.5,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currCarouselIndex = index;
                      });
                    },
                  ),
                  items: List.generate(3, (index) => _buildPlaceholder()),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        }, //Abrir menu lateral
                        child: CircleAvatar(
                          backgroundColor: AppTheme.highlightDark,
                          child: Text(
                            widget.currUser.person.getInitials(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1F2024),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 15,
                        ))),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [0, 1, 2].map((index) {
                      return GestureDetector(
                        onTap: () => _carouselController.animateToPage(index),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currCarouselIndex == index
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.currObject.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1F2024),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.currObject.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF71727A),
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            )
          ],
        )),
        floatingActionButtonLocation:
            isObjectOwner ? FloatingActionButtonLocation.centerFloat : null,
        floatingActionButton: isObjectOwner
            ? TextButton(
                onPressed: () {
                  _showRemoveObjectDialog(context);
                },
                style: removeButtonStyle,
                child: const Text(
                  "Excluir",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null);
  }

  Widget _buildPlaceholder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(0),
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Color(0xFFB4DBFF),
          size: 50,
        ),
      ),
    );
  }
}
