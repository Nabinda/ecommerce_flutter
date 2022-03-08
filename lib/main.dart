import 'dart:async';
import 'package:ecommerce/provider/category_provider.dart';
import 'package:ecommerce/provider/network_status_provider.dart';
import 'package:ecommerce/provider/theme_provider.dart';
import 'package:ecommerce/screens/bottom_bar_navigation_screen.dart';
import 'package:ecommerce/values/routes.dart';
import 'package:ecommerce/values/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? true;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => NetworkStatusProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ], child: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.getTheme(),
      title: "Ecommerce",
      home: const CheckConnection(),
      routes: Routes.routes,
    );
  }
}

class CheckConnection extends StatefulWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  _CheckConnectionState createState() => _CheckConnectionState();
}

class _CheckConnectionState extends State<CheckConnection> {
  bool status = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), getStatus);
  }

  getStatus() async {
    bool connectionStatus =
        await Provider.of<NetworkStatusProvider>(context, listen: false)
            .checkConnection();
    setState(() {
      status = connectionStatus;
    });
    Timer(const Duration(seconds: 5), getStatus);
  }

  @override
  Widget build(BuildContext context) {
    return status
        ? const BottomBarNavigationScreen()
        : const Text("No Internet");
    //TODO:: Nice Buffering
  }
}
