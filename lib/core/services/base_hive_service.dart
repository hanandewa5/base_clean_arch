import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseHiveService {
  Future<void> init() async {
    await Hive.initFlutter();
    registerAdapter();
  }

  void registerAdapter();

  //#region INSERT

  Future<void> insert({required String boxName, required dynamic data}) async {
    try {
      Box box = await openBox(boxName);
      await box.add(data);
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<void> insertOne({required String boxName, required String keyName, required dynamic data}) async {
    try {
      Box box = await openBox(boxName);
      await box.put(keyName, data);
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<void> insertAll<DataType>({required String boxName, required List<dynamic> listData}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.addAll(listData);
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  //#endregion

  //#region UPDATE

  Future<void> updateAt<DataType>({required String boxName, required int index, required dynamic data}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      await box.putAt(index, data);
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  //#endregion

  //#region GET

  Future<List<dynamic>> getAll<DataType>({required String boxName}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      dynamic results = box.values.toList();
      if (box.isOpen) {
        await box.close();
      }
      return results ?? [];
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<List<DataType>> getSome<DataType>({required String boxName, required int page, required int pageSize}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      int length = box.length;
      int limit = pageSize;
      int offset = (page - 1) * limit;
      int maxIndex = ((offset + limit) < length) ? (offset + limit) : (length);
      List<DataType> tempList = [];
      for (int i = offset; i < maxIndex; i++) {
        DataType result = box.getAt(i);
        tempList.add(result);
      }
      if (box.isOpen) {
        await box.close();
      }
      return tempList;
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<int> getDataLength<DataType>({required String boxName}) async {
    try {
      Box box = await openBox<DataType>(boxName);
      int length = box.length;
      if (box.isOpen) {
        await box.close();
      }
      return length;
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<dynamic> getFirst({required String boxName}) async {
    try {
      Box box = await openBox(boxName);
      dynamic results = box.getAt(0);
      if (box.isOpen) {
        await box.close();
      }
      return results;
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<dynamic> getOne({required String boxName, required String keyName}) async {
    try {
      Box box = await openBox(boxName);
      dynamic result = await box.get(keyName);
      if (box.isOpen) {
        await box.close();
      }
      return result;
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  //#endregion

  //#region DELETE

  Future<void> deleteAll({required String boxName}) async {
    try {
      Box box = await openBox(boxName);
      await box.clear();
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<void> deleteOne({required String boxName, required String keyName}) async {
    try {
      Box box = await openBox(boxName);
      await box.delete(keyName);
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  Future<void> deleteAt({required String boxName, required int index}) async {
    try {
      Box box = await openBox(boxName);
      await box.deleteAt(index);
      if (box.isOpen) {
        await box.close();
      }
    } catch (error) {
      throw HiveError(error.toString());
    }
  }

  //#endregion

  //#region CORE

  Future<Box> openBox<DataType>(String boxName) async {
    try {
      final isBoxOpen = Hive.isBoxOpen(boxName);
      if (isBoxOpen) {
        final Box box = Hive.box<DataType>(boxName);
        return box;
      } else {
        final Box box = await Hive.openBox<DataType>(boxName);
        return box;
      }
    } catch (error) {
      throw HiveError('OPEN BOX ERROR | ${error.toString()}');
    }
  }

  //#endregion
}
