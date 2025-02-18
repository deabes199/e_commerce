import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_store_app/bloc_observer.dart';
import 'package:hero_store_app/core/database/hive_service.dart';
import 'package:hero_store_app/core/di/dependancy_injection.dart';
import 'package:hero_store_app/core/helpers/functions.dart';
import 'package:hero_store_app/core/helpers/shared_pref_helper.dart';
import 'package:hero_store_app/core/routing/app_router.dart';
import 'package:hero_store_app/core/routing/routes.dart';
import 'package:hero_store_app/core/theming/cubit/theme_cubit.dart';
import 'package:hero_store_app/core/theming/theme_mode.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:hero_store_app/firebase_options.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

bool isLoggedInUser = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ScreenUtil.ensureScreenSize();

  await setUpGetIt();
  await getIt<CacheHelper>().init();
  await HelperFunctions.checkIfLoggedInUser();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  await Hive.deleteFromDisk();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ReviewAdapter());
  Hive.registerAdapter(SignupResponseModelAdapter());
  await Hive.openBox<SignupResponseModel>('user');

  await HiveServices.init();

  Bloc.observer = MyBlocObserver();

  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            splitScreenMode: true,
            minTextAdapt: true,
            builder: (context, child) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, state) {
                  return MaterialApp(
                    darkTheme: getDarkThemeMode(),
                    theme: getThemeMode(),
                    themeMode: state,
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: appRouter.generateRoute,
                    initialRoute: isLoggedInUser
                        ? Routes.bottomNavBarScreen
                        : Routes.loginScreen,
                  );
                },
              );
            }));
  }
}
