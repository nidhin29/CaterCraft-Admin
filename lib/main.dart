import 'package:catering/Application/Owner/owner_cubit.dart';
import 'package:catering/Application/Staff/staff_cubit.dart';
import 'package:catering/Application/booking/booking_cubit.dart';
import 'package:catering/Application/loggedin/loggedin_cubit.dart';
import 'package:catering/Application/signin/signin_cubit.dart';
import 'package:catering/Infrastructure/Core/notification_service.dart';
import 'package:catering/Presentation/Auth/splash.dart';
import 'package:catering/Presentation/common/theme.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:catering/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  
  // Start independent initializations in parallel
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    dotenv.load(fileName: ".env"),
  ]);

  // Initialize notifications after Firebase is ready
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  
  // Run these in parallel as well
  await Future.wait([
    NotificationService().initialize(),
    configureInjection(Environment.prod),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SigninCubit>(create: (context) => getIt<SigninCubit>()),
        BlocProvider<LoggedinCubit>(create: (context) => getIt<LoggedinCubit>()),
        BlocProvider<OwnerCubit>(create: (context) => getIt<OwnerCubit>()),
        BlocProvider<StaffCubit>(create: (context) => getIt<StaffCubit>()),
        BlocProvider<BookingCubit>(create: (context) => getIt<BookingCubit>()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
