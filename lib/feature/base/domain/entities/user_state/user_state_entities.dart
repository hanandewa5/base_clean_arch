
import 'package:hive/hive.dart';

part 'user_state_entities.g.dart';

@HiveType(typeId: 1)
enum UserStateEntities {
  @HiveField(0)
  notLoggedIn,
  @HiveField(1)
  loggedIn,
  @HiveField(2)
  priceChecker,
  @HiveField(3)
  cashier,
}
