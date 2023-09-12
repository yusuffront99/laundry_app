import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/pages/dashboard_views/account_view.dart';

class AppConstants {
  static const appName = 'My Laundry';

  /// == home network

  /// == office newtowrk
  static const _host = 'http://10.8.248.18:8000';

  ///  baseURL = http://192.168.1.14:8000/api
  static const baseURL = '$_host/api';

  ///  baseURL = http://192.168.1.14:8000/storage
  static const baseImageURL = '$_host/storage';

  static const laundryStatusCategory = [
    'All',
    'Pickup',
    'Queue',
    'Process',
    'Washing',
    'Dried',
    'Ironed',
    'Done',
    'Delivery'
  ];

  // ==navbar menu
  static List<Map> navMenuDashboard = [
    {
      'view': DView.empty('home'),
      'icon': Icons.home_filled,
      'label': 'Home',
    },
    {
      'view': DView.empty('My Laundry'),
      'icon': Icons.local_laundry_service,
      'label': 'My Laundry',
    },
    {
      'view': AccountView(),
      'icon': Icons.account_circle,
      'label': 'Account',
    },
  ];
  // ==navbar menu
}
