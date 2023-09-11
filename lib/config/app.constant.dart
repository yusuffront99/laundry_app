class AppConstants {
  static const appName = 'My Laundry';

  /// == home network
  // static const _host = 'http://192.168.1.14:8000';

  /// == office newtowrk
  static const _host = 'http://10.8.248.144:8000';

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
}
