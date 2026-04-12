import 'package:bloc/bloc.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:catering/Domain/LoggedIn/logged_in_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'loggedin_state.dart';
part 'loggedin_cubit.freezed.dart';

@injectable
class LoggedinCubit extends Cubit<LoggedinState> {
  final TokenService tokenService;
  final LoggedInService loggedInService;

  LoggedinCubit(this.tokenService, this.loggedInService)
    : super(LoggedinState.initial());

  Future<void> checkSession() async {
    final token = await tokenService.getToken();
    final onboarded = await loggedInService.isOnboarded();
    
    if (token != null) {
      final role = await tokenService.getRole();
      emit(state.copyWith(value: true, role: role, isOnboarded: onboarded));
    } else {
      emit(state.copyWith(value: false, role: null, isOnboarded: onboarded));
    }
  }

  Future<void> clearSession() async {
    await tokenService.clearAll();
    emit(state.copyWith(value: false, role: null));
  }
}
