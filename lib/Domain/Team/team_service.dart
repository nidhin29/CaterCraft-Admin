import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Team/customer_model/customer_model.dart';
import 'package:catering/Domain/Team/team_model/team_model.dart';
import 'package:dartz/dartz.dart';

abstract class TeamService {
  Future<Either<MainFailure, TeamModel>> getTeam();
  Future<Either<MainFailure, CustomerModel>> getCustomers();
}
