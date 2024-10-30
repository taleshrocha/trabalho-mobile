import 'package:flutter/material.dart';
import '../entities/group.dart';
import '../entities/user.dart';
import '../themes/theme.dart';
import 'login_page.dart';
import 'object_list_page.dart';

class AppDrawer extends StatelessWidget {
  final User loggedUser;
  final Group userGroup;

  const AppDrawer({required this.loggedUser, required this.userGroup});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                loggedUser.person.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1F2024),
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                loggedUser.email,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF1F2024),
                  fontWeight: FontWeight.w300,
                ),
              ),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.all(15.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {}, //Abrir menu lateral
                    child: CircleAvatar(
                      backgroundColor: AppTheme.highlightDark,
                      child: Text(
                        loggedUser.person.getInitials(),
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
              decoration: const BoxDecoration(
                  color: Colors.white
              ),
            ),
            const Divider(
              color: Color(0xFF3D4A6B),
              thickness: 0.3,
              indent: 0,
              endIndent: 0,
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.crop_square, color: Color(0xFF006FFD),),
                    title: const Text(
                      "Objetos",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1F2024),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ObjectListPage(
                              userGroup: userGroup,
                              loggedUser: loggedUser)));
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1F2024),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage(userGroup: userGroup)),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}