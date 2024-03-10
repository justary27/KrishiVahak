import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              child: Text("A"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "User",
              style: GoogleFonts.redHatDisplay(
                textStyle: const TextStyle(
                  color: Color.fromRGBO(89, 50, 234, 1),
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color.fromRGBO(89, 50, 234, 1),
              ),
              title: Text(
                "Settings",
                style: GoogleFonts.redHatDisplay(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(89, 50, 234, 1),
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
                color: Color.fromRGBO(89, 50, 234, 1),
              ),
              title: Text(
                "Language",
                style: GoogleFonts.redHatDisplay(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(89, 50, 234, 1),
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Color.fromRGBO(89, 50, 234, 1),
              ),
              title: Text(
                "Logout",
                style: GoogleFonts.redHatDisplay(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(89, 50, 234, 1),
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
