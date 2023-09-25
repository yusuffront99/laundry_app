import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/app_session.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:laundry_app/datasources/laundry_datasource.dart';
import 'package:laundry_app/models/laundry_model.dart';
import 'package:laundry_app/models/user_model.dart';
import 'package:laundry_app/providers/my_laundry_provider.dart';

class MyLaundryView extends ConsumerStatefulWidget {
  const MyLaundryView({super.key});

  @override
  ConsumerState<MyLaundryView> createState() => _MyLaundryViewState();
}

class _MyLaundryViewState extends ConsumerState<MyLaundryView> {
  late UserModel user;
  getMyLaundry() {
    LaundryDatasource.readByUser(user.id).then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              setMyLaundryStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              setMyLaundryStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              setMyLaundryStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              setMyLaundryStatus(ref, 'Bad request');
              break;
            case UnauthorisedFailure:
              setMyLaundryStatus(ref, 'Unauthorised');
              break;
            default:
              setMyLaundryStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          setMyLaundryStatus(ref, 'Success');
          List data = result['data'];
          List<LaundryModel> laundries =
              data.map((e) => LaundryModel.fromJson(e)).toList();
          ref.read(myLaundryListProvider.notifier).setData(laundries);
        },
      );
    });
  }

  @override
  void initState() {
    AppSession.getUser().then((value) {
      user = value!;
      getMyLaundry();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
