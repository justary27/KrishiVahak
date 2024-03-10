import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(51.509364, -0.128928),
              // initialZoom: 10.2,
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
            bottom: 0,
            child: Container(
              width: size.width,
              height: 0.3 * size.height,
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      width: size.width,
                      // height: 0.3 * size.height,
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            title: const Text("Darrell Steward"),
                            subtitle: const Text("Rice transporter"),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.call),
                            ),
                          ),
                          const ListTile(
                            dense: true,
                            title: Text("Rs 100/kg "),
                            // subtitle: Text("Rd Amritsar, Punjab 85486 "),
                          ),
                          const ListTile(
                            dense: true,
                            title: Text("8502 Delhi "),
                            subtitle: Text("Rd Amritsar, Punjab 85486 "),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(89, 50, 234, 1),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                "See details",
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
                  );
                },
                itemCount: 4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
