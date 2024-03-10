import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _srcController;
  late TextEditingController _destController;

  @override
  void initState() {
    _srcController = TextEditingController();
    _destController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Krishi Vahak",
          style: GoogleFonts.redHatDisplay(
            textStyle: const TextStyle(
              color: Color.fromRGBO(89, 50, 234, 1),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              child: Text("A"),
            ),
            onPressed: () {
              context.push("/profile");
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(51.509364, -0.128928),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                const RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      // onTap: () => launchUrl(
                      //     Uri.parse('https://openstreetmap.org/copyright')),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    height: 0.23 * size.height,
                    // padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  8.0,
                                ),
                                child: Text(
                                  "Source",
                                  style: GoogleFonts.redHatDisplay(
                                    textStyle: const TextStyle(
                                      color: Color.fromRGBO(89, 50, 234, 1),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.location_on,
                                  color: Color.fromRGBO(89, 50, 234, 1),
                                ),
                                title: const Text(
                                  "Current Location",
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(
                              // vertical: 10,
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Destination",
                                  style: GoogleFonts.redHatDisplay(
                                    textStyle: const TextStyle(
                                      color: Color.fromRGBO(89, 50, 234, 1),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                leading: const Icon(
                                  Icons.location_on,
                                  color: Colors.redAccent,
                                ),
                                title: const Text("Select"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                width: size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.redHatDisplay(
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(89, 50, 234, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                color: const Color.fromRGBO(89, 50, 234, 1),
                                onPressed: () {},
                                icon: const Icon(Icons.free_breakfast),
                              ),
                              Text(
                                "Fruit",
                                style: GoogleFonts.redHatDisplay(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(89, 50, 234, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                color: const Color.fromRGBO(89, 50, 234, 1),
                                onPressed: () {},
                                icon: const Icon(Icons.cloud),
                              ),
                              Text(
                                "Vegetables",
                                style: GoogleFonts.redHatDisplay(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(89, 50, 234, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                color: const Color.fromRGBO(89, 50, 234, 1),
                                icon: const Icon(
                                  Icons.dinner_dining,
                                ),
                              ),
                              Text(
                                "Flowers",
                                style: GoogleFonts.redHatDisplay(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(89, 50, 234, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                color: const Color.fromRGBO(89, 50, 234, 1),
                                icon: const Icon(
                                  Icons.lunch_dining,
                                ),
                              ),
                              Text(
                                "Dairy",
                                style: GoogleFonts.redHatDisplay(
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(89, 50, 234, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                          context.push("/services");
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
                          "Search",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
