import 'package:dartz/dartz.dart';
import 'package:laundry_app/config/app.constant.dart';
import 'package:laundry_app/config/app_request.dart';
import 'package:laundry_app/config/app_response.dart';
import 'package:laundry_app/config/app_session.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:http/http.dart' as http;
import 'package:laundry_app/models/user_model.dart';

class LaundryDatasource {
  static Future<Either<Failure, Map>> readByUser(int userId) async {
    Uri url = Uri.parse('${AppConstants.baseURL}/laundry/user/${userId}');
    final token = await AppSession.getBearerToken();

    try {
      final response = await http.get(
        url,
        headers: AppRequest.header(token),
      );
      final data = AppResponse.data(response);
      return Right(data);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(FetchFailure(e.toString()));
    }
  }

  static Future<Either<Failure, Map>> claim(String id, String claimcode) async {
    Uri url = Uri.parse('${AppConstants.baseURL}/laundry/claim');
    UserModel? user = await AppSession.getUser();
    final token = await AppSession.getBearerToken();
    try {
      final response = await http.post(url,
          headers: AppRequest.header(token),
          body: {
            'id': id,
            'claim_code': claimcode,
            'user_id': user!.id.toString()
          });
      final data = AppResponse.data(response);
      return Right(data);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(FetchFailure(e.toString()));
    }
  }
}
