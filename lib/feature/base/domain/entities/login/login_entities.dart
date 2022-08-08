import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'login_entities.g.dart';

@HiveType(typeId: 99)
class LoginEntities extends Equatable {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final bool? passwordExpired;
  @HiveField(2)
  final String? userName;
  @HiveField(3)
  final String? fullName;
  @HiveField(4)
  final String? subscription;
  @HiveField(5)
  final String? billingPhone;
  @HiveField(6)
  final String? phone;
  @HiveField(7)
  final List<dynamic>? roles;
  @HiveField(8)
  final String? restoreId;
  @HiveField(9)
  final List<int>? acls;
  @HiveField(10)
  final int? currentLocation;
  @HiveField(11)
  final int? packageId;
  @HiveField(12)
  final int? trialLeft;
  @HiveField(13)
  final bool? showGettingStarted;
  @HiveField(14)
  final bool? showOnboardingWizard;
  @HiveField(15)
  final int? currentCompany;
  @HiveField(16)
  final String? companies;
  @HiveField(17)
  final bool? isOwner;
  @HiveField(18)
  final bool? posShowGettingStarted;
  @HiveField(19)
  final bool? enableFulfillment;
  @HiveField(20)
  final bool? isWmsMigrated;

  const LoginEntities({
    this.token,
    this.passwordExpired,
    this.userName,
    this.fullName,
    this.subscription,
    this.billingPhone,
    this.phone,
    this.roles,
    this.restoreId,
    this.acls,
    this.currentLocation,
    this.packageId,
    this.trialLeft,
    this.showGettingStarted,
    this.showOnboardingWizard,
    this.currentCompany,
    this.companies,
    this.isOwner,
    this.posShowGettingStarted,
    this.enableFulfillment,
    this.isWmsMigrated,
  });

  factory LoginEntities.fromJson(Map<String, dynamic> json) {
    return LoginEntities(
      token: json['token'],
      passwordExpired: json['passwordExpired'],
      userName: json['userName'],
      fullName: json['fullName'],
      subscription: json['subscription'],
      billingPhone: json['billingPhone'],
      phone: json['phone'],
      roles: json['roles'] != null ? (json['roles'] as List<dynamic>).map((i) => i).toList() : null,
      restoreId: json['restoreId'],
      acls: json['acls'] != null ? (json['acls'] as List<dynamic>).map((i) => i as int).toList() : null,
      currentLocation: json['currentLocation'],
      packageId: json['packageId'],
      trialLeft: json['trialLeft'],
      showGettingStarted: json['showGettingStarted'],
      showOnboardingWizard: json['showOnboardingWizard'],
      currentCompany: json['currentCompany'],
      companies: json['companies'],
      isOwner: json['isOwner'],
      posShowGettingStarted: json['posShowGettingStarted'],
      enableFulfillment: json['enableFulfillment'],
      isWmsMigrated: json['isWmsMigrated'],
    );
  }

  @override
  List<Object?> get props => [
        token,
        passwordExpired,
        userName,
        fullName,
        subscription,
        billingPhone,
        phone,
        roles,
        restoreId,
        acls,
        currentLocation,
        packageId,
        trialLeft,
        showGettingStarted,
        showOnboardingWizard,
        currentCompany,
        companies,
        isOwner,
        posShowGettingStarted,
        enableFulfillment,
        isWmsMigrated,
      ];
}
