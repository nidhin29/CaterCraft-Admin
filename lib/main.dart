import 'package:catering/Application/Feedback/feedback_cubit.dart';
import 'package:catering/Application/View/view_cubit.dart';
import 'package:catering/Application/booking/booking_cubit.dart';
import 'package:catering/Application/loggedin/loggedin_cubit.dart';
import 'package:catering/Application/signin/signin_cubit.dart';
import 'package:catering/Presentation/Auth/splash.dart';
import 'package:catering/core/injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
           BlocProvider<SigninCubit>(create: (context) => getIt<SigninCubit>()),
        BlocProvider<LoggedinCubit>(
          create: (context) => getIt<LoggedinCubit>(),
        ),
        BlocProvider<BookingCubit>(create: (context) => getIt<BookingCubit>()),
        BlocProvider<FeedbackCubit>(
          create: (context) => getIt<FeedbackCubit>(),
        ),
        BlocProvider<ViewCubit>(create: (context) => getIt<ViewCubit>()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
  }
}
