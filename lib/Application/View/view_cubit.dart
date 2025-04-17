import 'package:bloc/bloc.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Team/customer_model/customer_model.dart';
import 'package:catering/Domain/Team/team_model/team_model.dart';
import 'package:catering/Domain/Team/team_service.dart';
import 'package:catering/Domain/feedback/feedback_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'view_state.dart';
part 'view_cubit.freezed.dart';

@injectable
class ViewCubit extends Cubit<ViewState> {
  final TeamService _teamService;
  final FeedbackService _feedbackService;
  ViewCubit(this._teamService, this._feedbackService)
    : super(ViewState.initial());
  getTeam() async {
    emit(state.copyWith(isLoading: true));
    final result = await _teamService.getTeam();
    result.fold(
      (f) {
        emit(
          state.copyWith(isLoading: false, isFailureOrSuccess: some(left(f))),
        );
      },
      (r) {
        emit(
          state.copyWith(isLoading: false, isFailureOrSuccess: some(right(r))),
        );
      },
    );
  }

  getCustomer() async {
    emit(state.copyWith(isLoading: true));
    final result = await _teamService.getCustomers();
    result.fold(
      (f) {
        emit(
          state.copyWith(
            isLoading: false,
            isCustomerFailureOrSuccess: some(left(f)),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            isCustomerFailureOrSuccess: some(right(r)),
          ),
        );
      },
    );
  }

  deleteCustomer(String email) async {
    emit(state.copyWith(isLoading: true, isDeleteOwner: none()));
    final result = await _feedbackService.delOwner(email);
    result.fold(
      (f) {
        emit(state.copyWith(isLoading: false, isDeleteOwner: some(left(f))));
      },
      (r) {
        getTeam();
        emit(state.copyWith(isLoading: false, isDeleteOwner: some(right(r))));
      },
    );
  }
}
