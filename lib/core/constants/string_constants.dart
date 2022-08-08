class StringConstants {
  static const String appTitle = 'App';
  static const String appEventChannel = 'app.com/events';
  static const String appMethodChannel = 'app.com/channel';
  static const String availableDevices = 'Available Devices';
  static const String bondedDevices = 'Bonded Devices';
  static const String httpApplicationJson = 'application/json';

  static const String labelConnectionMethod = 'Connection Method';
  static const String labelConnectedDevice = 'Recently Connected Device';
  static const String labelCategoryDevice = 'Category Device';
  static const String labelConnectDevice = 'Connect Device';
  static const String labelSavedDevice = 'Saved Device';
  static const String labelAddDevice = 'Add Device';
  static const String labelChange = 'Change';
  static const String labelConnect = 'Connect';
  static const String labelConnected = 'Connected';
  static const String labelDisconnect = 'Disconnect';
  static const String labelDisconnected = 'Disconnected';
  static const String labelBluetooth = 'Bluetooth';
  static const String labelWifiEthernet = 'Wifi or Ethernet';
  static const String labelUSB = 'USB';
  static const String labelPrintTest = 'Test Print';
  static const String labelPrintSuccess = 'Print document success';
  static const String labelPrintFailed = 'Print document failed';
  static const String labelPrintLoading = 'Print document in progress';
  static const String labelRequestPermission = 'Request Permission';
  static String labelConnectToCategory(String? categoryName) => 'Connect your device with $categoryName devices';
  static const String labelSecurityWarning = 'Security Warning!';
  static const String errorDeviceJailBroken = 'This app cannot be installed on jailbroken devices. Please install to another device.';


  static const String manufacturerSunmi = 'Sunmi';

  static const String success = 'Success';
  static const String refresh = 'Refresh';

  static String successConnectDevice(String? deviceName) => 'Success connect to $deviceName';
  static String connectingToDevice(String? deviceName) => 'Connecting to $deviceName';

  static const String instructionBluetoothOff = 'Please turn on Bluetooth';
  static const String instructionLocationPermission = 'Please granted location permission';
  static const String instructionRefresh = 'Please refresh';

  static const String errorDeviceNotSupported = 'Current device not supported';
  static const String errorSelectDevice = 'Unable to select device';
  static const String errorLoadingDevice = 'Error loading devices';
  static const String errorDeviceNotFound = 'No device saved, Please add device';
  static const String errorDeviceNotAvailable = 'No device available';
  static const String errorLoadConnection = 'Fail to load connections';
  static const String errorNotOfPaper = 'Out of paper, please check printer paper';
  static const String errorNoPrinterDetected = 'No printer detected, please connect with another printer device to continue';
  static const String errorPrinterError = 'Something wrong, please check printer device';
  static const String errorPrintNoData = 'Something wrong, please try print again';
  static const String errorLoadingDisplay = 'Error Loading Display';
  static const String errorLoadingCategory = 'Something wrong when loading category, please try again later';
  static const String errorPermissionNotGranted = 'Please allow permission by going to $appTitle\'s App info > Permissions > Allow all permissions then Re-open app';

}
