import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/group.dart';
import 'package:trabalho_mobile/entities/user.dart';
import 'package:trabalho_mobile/pages/add_object_page.dart';
import 'package:trabalho_mobile/themes/theme.dart';
import 'package:trabalho_mobile/entities/object.dart';

class ObjectListPage extends StatefulWidget {
  final Group userGroup;
  final User loggedUser;

  ObjectListPage(
      {super.key, required this.userGroup, required this.loggedUser});

  @override
  _ObjectListPageState createState() => _ObjectListPageState();
}

class _ObjectListPageState extends State<ObjectListPage> {
  void handleAddObject(Object object) {
    widget.loggedUser.addObject(object);
    setState(() {});
  }

  void handleRemoveObject(Object object) {
    widget.loggedUser.objects.remove(object);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Object> allObjects = widget.userGroup.getAllObjects();
    allObjects.sort((a, b) => a.name.compareTo(b.name));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Objetos",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF1F2024),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: 12,
              left: 15,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {}, //Abrir menu lateral
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.highlightDark,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.loggedUser.person.getInitials(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF1F2024),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: allObjects.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {}, //página com os detalhes do objeto
                    child: Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Container(
                              width: 90,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF2FF),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Icon(Icons.image,
                                  size: 50, color: Color(0xFFB4DBFF)),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    allObjects[index].name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF1F2024),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.userGroup
                                        .getObjectOwner(allObjects[index].id)!
                                        .person
                                        .name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF71727A),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (index < allObjects.length - 1)
                  const Divider(
                    color: Color(0xFF3D4A6B),
                    thickness: 0.1,
                    indent: 15,
                    endIndent: 15,
                  ),
              ],
            );
          }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddObjectPage(addObject: handleAddObject)));
        }, //adicionar objeto ao usuário logado
        mini: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.0),
        ),
        backgroundColor: const Color(0xFF006FFD),
        child: const Icon(
          Icons.add,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
