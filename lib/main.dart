import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/storage/share_pref.dart';
import 'package:weather_app/ui/home_page.dart';
import 'package:weather_app/utils/navigator.dart';
import 'package:weather_app/vm/internet_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ConnectionUtils.getActiveStatus(context);
    super.initState();
  }

  @override
  void dispose() {
    ConnectionUtils.getActiveStatus(context);
    super.dispose();
  }

  @override
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () => MaterialApp(
              navigatorKey: navigator.key,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // scaffoldBackgroundColor: const Color(0xff8862FC),
                fontFamily: 'DM Sans',
                textTheme: GoogleFonts.dmSansTextTheme(
                  Theme.of(context).textTheme,
                ),
                // primarySwatch: Colors.blue,
              ),
              home: const HomePage(),
            ));
  }
}
