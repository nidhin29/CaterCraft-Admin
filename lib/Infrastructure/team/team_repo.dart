import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Team/customer_model/customer_model.dart';
import 'package:catering/Domain/Team/team_model/team_model.dart';
import 'package:catering/Domain/Team/team_service.dart';
import 'package:catering/constants/const.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TeamService)
class TeamRepo implements TeamService {
  @override
  Future<Either<MainFailure, TeamModel>> getTeam() async {
    try {
      final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
      final Response response = await Dio(
        BaseOptions(headers: headers),
      ).get("${baseUrl}Admin/view_all_owners/");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final teamModel = TeamModel.fromJson(response.data);
        return Right(teamModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future<Either<MainFailure, CustomerModel>> getCustomers() async{
   try {
      final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
      final Response response = await Dio(
        BaseOptions(headers: headers),
      ).get("${baseUrl}Admin/get_all_customers/");
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final customerModel = CustomerModel.fromJson(response.data);
        return Right(customerModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
