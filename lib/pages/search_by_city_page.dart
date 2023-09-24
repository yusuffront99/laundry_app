import 'package:flutter/material.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:laundry_app/datasources/shop_datasource.dart';
import 'package:laundry_app/models/shop_model.dart';

class SearchByCity extends StatefulWidget {
  const SearchByCity({super.key, required this.query});
  final String query;

  @override
  State<SearchByCity> createState() => _SearchByCityState();
}

class _SearchByCityState extends State<SearchByCity> {
  final edtSearch = TextEditingController();

  execute() {
    ShopDataSource.searchByCity(edtSearch.text).then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              break;
            case NotFoundFailure:
              break;
            case ForbiddenFailure:
              break;
            case BadRequestFailure:
              break;
            case UnauthorisedFailure:
              break;
            default:
              break;
          }
        },
        (result) {
          List data = result['data'];
          List<ShopModel> list =
              data.map((e) => ShopModel.fromJson(e)).toList();
        },
      );
    });
  }

  @override
  void initState() {
    if (widget.query != '') {
      edtSearch.text = widget.query;
      execute();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
