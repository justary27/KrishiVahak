import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.1 * size.height,
              width: size.width,
            ),
            SizedBox(
              width: size.width,
              height: 0.9 * size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Krishi Vahak",
                            style: GoogleFonts.redHatDisplay(
                              textStyle: const TextStyle(
                                fontSize: 40,
                                color: Color.fromRGBO(89, 50, 234, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    LoginForm(
                      size: size,
                      parentContext: context,
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

  @override
  void dispose() {
    super.dispose();
  }
}

class LoginForm extends StatefulWidget {
  final Size size;
  final BuildContext parentContext;
  const LoginForm({
    super.key,
    required this.size,
    required this.parentContext,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  Future<void> logIn(String email, String password) async {
    SnackBar snackBar = SnackBar(
      padding: EdgeInsets.zero,
      dismissDirection: DismissDirection.startToEnd,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 20),
      content: ListTile(
        leading: Transform.scale(
          scale: 0.5,
          child: CircularProgressIndicator(
            color: Colors.grey.shade700,
          ),
        ),
        title: Text(
          "Logging in ...",
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
      // content: Text("Logging in ..."),
    );

    ScaffoldMessenger.of(widget.parentContext).showSnackBar(snackBar);
    try {} catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final Size size = widget.size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 0.75 * size.width,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                  child: Text("Name"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    } else {
                      if (!value.contains('@')) {
                        return "Please enter a valid email.";
                      }
                    }
                    return null;
                  },
                  style: GoogleFonts.redHatDisplay(),
                  controller: emailController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5), width: 1.0),
                    ),
                    fillColor: Colors.white.withOpacity(0.35),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.75 * size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                  child: Text("Phone Number"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                  style: GoogleFonts.redHatDisplay(),
                  obscureText: true,
                  controller: passwordController,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.5), width: 1.0),
                    ),
                    fillColor: Colors.white.withOpacity(0.35),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              width: 0.75 * size.width,
              height: 50,
              child: TextButton(
                onPressed: () async {
                  context.push("/");
                  // if (_formKey.currentState!.validate()) {
                  //   await logIn(emailController.text, passwordController.text);
                  // }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(89, 50, 234, 1),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  "Log In",
                  style: GoogleFonts.redHatDisplay(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
              ),
              TextButton(
                onPressed: () {
                  context.replace("/signup");
                },
                child: const Text("Sign Up"),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
