import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitandfresh/app_routes.dart';
import 'package:fitandfresh/domain/cubit/auth/email_auth_cubit.dart';
import 'package:fitandfresh/domain/cubit/check_connection/connect_cubit.dart';
import 'package:fitandfresh/domain/cubit/dark_mode/dark_cubit.dart';
import 'package:fitandfresh/domain/cubit/dark_mode/dark_state.dart';
import 'package:fitandfresh/domain/cubit/location/location_cubit.dart';
import 'package:fitandfresh/presentation/dialoges/noInternetDialoge.dart';
import 'package:fitandfresh/provider/countryProv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:one_context/one_context.dart';
import 'domain/cubit/auth/phone_auth_cubit.dart';
import 'domain/cubit/blocobserver.dart';
import 'domain/cubit/check_connection/connect_state.dart';
import 'domain/cubit/check_language/lang_cubit.dart';
import 'domain/cubit/check_language/lang_state.dart';
import 'domain/cubit/location/location_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      runApp(
        EasyLocalization(
          supportedLocales: [Locale('en', ''), Locale('ar', '')],

          path: 'assets/languages',
          // <-- change the path of the translation files
          fallbackLocale: Locale('en', ''),

          child: DevicePreview(
            enabled: true,
            builder: (context) => MultiProvider(providers: [
              ChangeNotifierProvider(create: (context) => CountryProv()),
            ], child: MyApp()), // Wrap your app
          ),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CheckLanguageCubit()),
        BlocProvider(
            create: (_) => CheckConnectionCubit()..initialConnection()),
        BlocProvider(create: (_) => PhoneAuthCubit()),
        BlocProvider(create: (_) => EmailAuthCubit()),
        BlocProvider(create: (_) => DarkModeCubit()),
        BlocProvider(
            create: (_) => LocationCubit()..checkService()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) =>
            BlocListener<LocationCubit,LocationStates>(
              listener: (BuildContext context, state) {  },
              child: BlocListener<CheckConnectionCubit, CheckConnectionState>(
          listener: (BuildContext context, state) {
              if (state is DisConnect) {
                OneContext().showDialog(
                    builder: (context) => NoInternetDialoge(
                          dismiss: false,
                        ));
              }

              if (state is Connect) {
                OneContext().popAllDialogs();
              }
          },
          child: BlocBuilder<CheckLanguageCubit, CheckLanguageState>(
              builder: (BuildContext context, state) {
                if (state is ArabicLanguage) {
//                CheckLanguageCubit
//                    .get(context)
//                    .isArabic = true;
                 // context.setLocale(Locale('ar'));
                  print(('salma').tr());
                } else {
                  print(('nada').tr());

//                CheckLanguageCubit
//                    .get(context)
//                    .isArabic = false;
                 // context.setLocale(Locale('en'));
                }


                return BlocBuilder<DarkModeCubit, DarkModeState>(
                  builder: (BuildContext context, state) {
                    if (state is DarkMode) {
                      DarkModeCubit
                          .get(context)
                          .isDark = true;
                    } else {
                      DarkModeCubit
                          .get(context)
                          .isDark = false;
                    }

                    return MaterialApp(
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
//                    brightness: DarkModeCubit.get(context).isDark
//                        ? Brightness.dark
//                        : Brightness.light,
                        //primaryColor: Colors.lightGreen,
                        backgroundColor: DarkModeCubit
                            .get(context)
                            .isDark ? Colors.grey.shade800 : Colors.white,
                        colorScheme: ColorScheme.fromSwatch().copyWith(
                          secondary: Colors.lightGreen,
                          primary: Colors.lightGreen,
                          brightness: DarkModeCubit
                              .get(context)
                              .isDark
                              ? Brightness.dark
                              : Brightness.light,
                        ),
                      ),
                      builder: OneContext().builder,
                      useInheritedMediaQuery: true,
                      onGenerateRoute: AppRoutes().onGenerateRoutes,
                    );
                  },

                );
              }
          ),
        ),
            ),
      ),
    );
  }
}
