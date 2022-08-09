import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:venu/provider/google_sign_in.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static const routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerHeight = MediaQuery.of(context).size.height * 0.55;
    final double imageHeight = MediaQuery.of(context).size.height * 0.50;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            } else if (snapshot.hasData) {
              debugPrint('gg it work');
            } else if (snapshot.hasError) {
              debugPrint("Error");
            }
            return SafeArea(
              child: Container(
                color: const Color(0xffE5E5E5),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: -30,
                      width: screenWidth,
                      child: Hero(
                        tag: " ",
                        child: SizedBox(
                          width: screenWidth,
                          height: imageHeight,
                          child: const RiveAnimation.asset(
                            'assets/images/login-page.riv',
                          ),
                        ),
                        // child: Image.asset(
                        //   'assets/images/sign_in.png',
                        //   fit: BoxFit.cover,
                        //   width: screenWidth,
                        //   height: imageHeight,
                        // ),
                      ),
                      // child: Image.asset(
                      //   'assets/images/sign_in.png',
                      //   width: screenWidth,
                      //   height: imageHeight,
                      // ),
                    ),
                    AnimatedPositioned(
                      bottom: 0,
                      curve: Curves.easeOutCubic,
                      duration: const Duration(milliseconds: 400),
                      child: Container(
                        width: screenWidth,
                        height: containerHeight,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45.0),
                            bottomRight: Radius.zero,
                            topLeft: Radius.circular(45.0),
                            bottomLeft: Radius.zero,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: const [
                                  SizedBox(
                                    width: 140.0,
                                    height: 50.0,
                                    child: RiveAnimation.asset('assets/images/venu-logo.riv'),
                                  ),
                                  Text(
                                    'VenU',
                                    style: TextStyle(
                                        fontFamily: "Google-Sans",
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 6.0),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 40.0),
                                child: const Text(
                                  'Take your first step to finding the perfect meeting venue',
                                  style: TextStyle(
                                    fontFamily: "Google-Sans",
                                    fontSize: 16.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 0.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);
                                    provider.googleLogin();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    minimumSize:
                                        const Size(double.infinity, 56),
                                    primary: const Color(0xffA7D1D7),
                                  ),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Colors.black,
                                  ),
                                  label: const Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontFamily: "Google-Sans",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 0.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);
                                    provider.logout();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    minimumSize:
                                        const Size(double.infinity, 56),
                                    primary: Colors.white,
                                    side: const BorderSide(
                                      color: Color(0xffA7D1D7),
                                      width: 3.0,
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontFamily: "Google-Sans",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
