import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BookServiceScreen extends StatefulWidget {
  const BookServiceScreen({super.key});

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Request Transportation",
              style: GoogleFonts.redHatDisplay(
                textStyle: const TextStyle(
                  // color: Color.fromRGBO(89, 50, 234, 1),
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 0.4 * size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Source",
                              style: GoogleFonts.redHatDisplay(
                                textStyle: const TextStyle(),
                              ),
                            ),
                            TextFormField(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 0.4 * size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Column",
                              style: GoogleFonts.redHatDisplay(
                                textStyle: const TextStyle(),
                              ),
                            ),
                            TextFormField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VehicleType",
                        style: GoogleFonts.redHatDisplay(
                          textStyle: const TextStyle(),
                        ),
                      ),
                      TextFormField(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.redHatDisplay(
                          textStyle: const TextStyle(),
                        ),
                      ),
                      TextFormField(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Crop type",
                        style: GoogleFonts.redHatDisplay(
                          textStyle: const TextStyle(),
                        ),
                      ),
                      TextFormField(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price/kg",
                        style: GoogleFonts.redHatDisplay(
                          textStyle: const TextStyle(),
                        ),
                      ),
                      TextFormField(),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        // context.push("/");
                        // if (_formKey.currentState!.validate()) {
                        //   await logIn(emailController.text, passwordController.text);
                        // }
                        context.push("/book_service");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(89, 50, 234, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Make Request",
                        style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
