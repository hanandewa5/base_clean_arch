class ApiUrl {
  static const String baseUrl = 'https://example.com';

  static const String salesUrl = '/sales/pos';

  static const String urlVersion2 = '$salesUrl/v2';

  static const String urlVersion3 = '$salesUrl/v3';

  static const String urlLogin = '/login';

  static const String urlLocations = '$urlVersion3/locations/';

  static const String urlUserInfo = '$urlVersion3/userInfo';

  static const String urlSettings = '$urlVersion3/settings';

  static String urlStruct(int locationId) => '$urlVersion3/struct/register/$locationId';

  static String urlDetailLocation(int locationId) => '$urlLocations$locationId/';

  //#region SHIPMENT

  static const String shipmentUrl = '/shipment';

  static const String urlProvince = '$shipmentUrl/province';

  static String urlCityByProvinceId(String provinceId) => '$shipmentUrl/city/$provinceId';

  //#endregion

}
