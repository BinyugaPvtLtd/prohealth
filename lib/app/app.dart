import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/provider/navigation_provider.dart';
import 'package:prohealth/app/routes_manager.dart';
import 'package:prohealth/presentation/screens/login_module/login/login_screen.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/home_module/home_screen.dart';
import '../presentation/screens/hr_module/register/widgets/after_clicking_on_link/on_boarding_welcome.dart';

class App extends StatelessWidget {
  final bool signedIn;
  bool _hasShownSplash = false;

  App({super.key, required this.signedIn});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff50B5E5),
          //secondary: const Color(0xff50B5E5),
        ),
        useMaterial3: false,
        // primarySwatch: Ma,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: _hasShownSplash
          ? '/'
          : signedIn == true
              ? HomeScreen.routeName
              : LoginScreen.routeName,
      routes: RoutesManager().getRoutes(token: signedIn),
      onGenerateRoute: (settings) {
        final routeProvider = Provider.of<RouteProvider>(context);
        var route = routeProvider.currentRoute;
        switch (route) {
          case '/':
            if (settings.name != "/") {
              return MaterialPageRoute(
                builder: (context) => SplashScreen(
                  onFinish: () =>
                      Navigator.of(context).pushReplacementNamed(route),
                ),
              );
            } else {
              return MaterialPageRoute(
                builder: (context) => SplashScreen(
                  onFinish: () => Navigator.of(context)
                      .popAndPushNamed(LoginScreen.routeName),
                ),
              );
            }
          case '${AppString.onboardingWelcome}':
            // widget.signedIn?(){}:setToken();
            return MaterialPageRoute(
              builder: (context) => SplashScreen(
                onFinish: () => Navigator.of(context)
                    .popAndPushNamed(OnBoardingWelcome.routeName),
              ),
            );
          default:
            _hasShownSplash = true;
            return MaterialPageRoute(
              builder: (context) => SplashScreen(
                onFinish: () =>
                    Navigator.of(context).pushReplacementNamed(route),
              ),
            );
        }
      },
    );
  }
}

class NonChromeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // primary: const Colors.yellow[700],
          // secondary: const Colors.yellow.shade700,

          // or from RGB

          primary: const Color(0xff50B5E5),
          //secondary: const Color(0xff50B5E5),
        ),
        useMaterial3: false,
        // primarySwatch: Ma,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                // "images/logo_login.png",
                "images/powered_logo.png",
                scale: 1.1,
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "This application is supported only in Google Chrome.",
                style: TextStyle(
                  fontSize: 28,
                  color: ColorManager.textPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                "images/chrome.png",
                scale: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinish;
  SplashScreen({required this.onFinish});

  @override
  void initState() {
    // Delay for 3 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      onFinish();
    });
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'images/splash_logo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
