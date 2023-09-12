import 'package:dartz/dartz.dart';
import 'package:laundry_app/config/app.constant.dart';
import 'package:laundry_app/config/app_request.dart';
import 'package:laundry_app/config/app_response.dart';
import 'package:laundry_app/config/app_session.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:http/http.dart' as http;

class PromoDataSource {
  static Future<Either<Failure, Map>> readLimit() async {
    Uri url = Uri.parse('${AppConstants.baseURL}/promo/limit');
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
}
