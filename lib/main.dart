import 'package:contactapp/shared/services/user_provider.dart';
import 'package:contactapp/shared/styles/themes.dart';
import 'package:contactapp/view/screens/auth/signup_screen.dart';
import 'package:contactapp/view/widgets/indicator_widget.dart';
import 'package:contactapp/view/widgets/navigation_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light));
  // await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: ((context) => ThemeNotifier())),
            ChangeNotifierProvider(create: ((_) => UserProvider()))
          ],
          child: Consumer<ThemeNotifier>(
            builder: (context, value, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: MyThemes.darkTheme,
                //  value.darkTheme ? MyThemes.darkTheme : MyThemes.lightTheme,
                home: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const MyCircularIndicator();
                      }
                      if (snapshot.hasData) {
                        return const Navigation();
                      }
                      return const SignUpScreen();
                    }),
              );
            },
          ),
        );
      },
    );
  }
}
