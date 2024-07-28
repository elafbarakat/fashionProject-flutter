//import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:theme_manager/theme_manager.dart';
import 'providers/brand_provider.dart';
import 'providers/category_provider.dart';
import 'providers/product_provider.dart';
import 'providers/user_provider.dart';
//import 'widgets/home/home.dart';
import 'widgets/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ChangeNotifierProvider(create: (context) => BrandProvider()),
    ], child: const UNDP()
        //  EasyLocalization(
        //   supportedLocales: const [Locale('en'), Locale('ar')],
        //   path:
        //       'lib/assets/translations', // <-- change the path of the translation files
        //   fallbackLocale: const Locale('ar'),
        //   startLocale: const Locale('ar'),
        //   child: UNDP(),
        // ),
        ),
  );
}

class UNDP extends StatefulWidget {
  const UNDP({super.key});

  @override
  State<UNDP> createState() => _UNDPState();
}

class _UNDPState extends State<UNDP> {
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.light,
      data: (Brightness brightness) => brightness == Brightness.light
          ? ThemeData(
              primarySwatch: Colors.blue,
              hintColor: Colors.lightBlue,
              brightness: Brightness.light,
            )
          : ThemeData(
              primarySwatch: Colors.blue,
              hintColor: Colors.lightBlue,
              // تلميح اللون
              // accentColor : لهجة اللون
              brightness: brightness,
            ),
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          theme: theme,
          home: LogIn(),
          //home: Home(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

//        const MaterialApp(
//         // home: Home(),
//         home: LogIn(),

//         debugShowCheckedModeBanner: false,
//       ),
//     ),
//   );
// }



