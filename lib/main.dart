import 'package:device_preview/device_preview.dart';
import 'package:fitandfresh/app_routes.dart';
import 'package:fitandfresh/provider/countryProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) =>
          MultiProvider(providers: [
            ChangeNotifierProvider(create: (context)=>CountryProv()),

          ],
          child: MyApp()), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) =>
           MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
               primaryColor: Colors.lightGreen,
               colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.lightGreen,primary:Colors.lightGreen ),
             ),


            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
             useInheritedMediaQuery: true,
            onGenerateRoute: AppRoutes().onGenerateRoutes,


          ),

    );

  }
}
