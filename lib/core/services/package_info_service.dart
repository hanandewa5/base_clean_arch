
import 'package:package_info_plus/package_info_plus.dart';

final PackageInfoService packageInfoService = PackageInfoService.instance;

class PackageInfoService {

  static final PackageInfoService _instance = PackageInfoService();

  static PackageInfoService get instance => _instance;

  String get version => _version;
  String get code => _code;

  String _version = '';
  String _code = '';

  Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    _code = packageInfo.buildNumber;
  }
}
