import 'package:bloc/bloc.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:catering/Domain/LoggedIn/logged_in_service.dart';
import 'package:injectable/injectable.dart';

part 'loggedin_state.dart';
part 'loggedin_cubit.freezed.dart';

@injectable
class LoggedinCubit extends Cubit<LoggedinState> {
  final LoggedInService loggedInService;
  final TokenService tokenService;
  LoggedinCubit(this.loggedInService, this.tokenService)
    : super(LoggedinState.initial());

  isLoggedIn() async {
    await Future.delayed(const Duration(seconds: 4));
    final response = await loggedInService.isLoggedIn();
    emit(state.copyWith(value: response));
  }

  deleteEmail() async {
    await tokenService.deleteEmail();
  }
}
