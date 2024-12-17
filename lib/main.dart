import 'package:fitness/routes/routes.dart';
import 'package:fitness/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 850),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.splashscreen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
