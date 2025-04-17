// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:catering/Application/booking/booking_cubit.dart' as _i767;
import 'package:catering/Application/Feedback/feedback_cubit.dart' as _i71;
import 'package:catering/Application/loggedin/loggedin_cubit.dart' as _i75;
import 'package:catering/Application/signin/signin_cubit.dart' as _i388;
import 'package:catering/Application/View/view_cubit.dart' as _i807;
import 'package:catering/Domain/bookings/booking_service.dart' as _i346;
import 'package:catering/Domain/feedback/feedback_service.dart' as _i715;
import 'package:catering/Domain/LoggedIn/logged_in_service.dart' as _i712;
import 'package:catering/Domain/SignIn/sign_in_service.dart' as _i675;
import 'package:catering/Domain/signout/sign_out_service.dart' as _i1009;
import 'package:catering/Domain/Team/team_service.dart' as _i1053;
import 'package:catering/Domain/TokenManager/token_service.dart' as _i870;
import 'package:catering/Infrastructure/booking/booking_repo.dart' as _i284;
import 'package:catering/Infrastructure/feedback/feedback_repo.dart' as _i197;
import 'package:catering/Infrastructure/LoggedIn/logged_in_repo.dart' as _i852;
import 'package:catering/Infrastructure/SignIn/sign_in_repo.dart' as _i545;
import 'package:catering/Infrastructure/signout/signout.dart' as _i157;
import 'package:catering/Infrastructure/team/team_repo.dart' as _i237;
import 'package:catering/Infrastructure/TokenManager/token_repo.dart' as _i623;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i715.FeedbackService>(() => _i197.FeedbackRepo());
    gh.lazySingleton<_i675.SignInService>(() => _i545.SignInRepo());
    gh.lazySingleton<_i712.LoggedInService>(() => _i852.LoggedInRepo());
    gh.lazySingleton<_i1053.TeamService>(() => _i237.TeamRepo());
    gh.lazySingleton<_i1009.SignOutService>(() => _i157.SignoutRepo());
    gh.lazySingleton<_i870.TokenService>(() => _i623.TokenRepo());
    gh.lazySingleton<_i346.BookingService>(() => _i284.BookingRepo());
    gh.factory<_i807.ViewCubit>(
      () => _i807.ViewCubit(
        gh<_i1053.TeamService>(),
        gh<_i715.FeedbackService>(),
      ),
    );
    gh.factory<_i388.SigninCubit>(
      () => _i388.SigninCubit(
        gh<_i675.SignInService>(),
        gh<_i870.TokenService>(),
      ),
    );
    gh.factory<_i71.FeedbackCubit>(
      () => _i71.FeedbackCubit(gh<_i715.FeedbackService>()),
    );
    gh.factory<_i767.BookingCubit>(
      () => _i767.BookingCubit(gh<_i346.BookingService>()),
    );
    gh.factory<_i75.LoggedinCubit>(
      () => _i75.LoggedinCubit(
        gh<_i712.LoggedInService>(),
        gh<_i870.TokenService>(),
      ),
    );
    return this;
  }
}
