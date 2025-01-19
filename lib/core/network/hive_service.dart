//hive ko initiation directory path haru diney and db banaune,
//ani tesma queries haru add garney like put request ko for add,
// yesmai resgister adapter ra open box ko concept use garnu parxa
//register adapter le box imean table banauxa of database
// ani open box le tes bhitra ko data or row read garxa

import 'package:hamroBooking/app/constants/hive_table_constant.dart';
import 'package:hamroBooking/features/auth/data/model/auth_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


class HiveService {
  static Future<void> init() async {
    // Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}/sajilotantra.db';

    Hive.init(path);

    // Register Adapters
    Hive.registerAdapter(UserHiveModelAdapter());
  }

  // User Queries

  // Add or Register a User
  Future<void> addUser(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.put(user.id, user);
  }

  // Delete a User
  Future<void> deleteUser(String id) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  // Get All Users
  Future<List<UserHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  // Find User by Email and Password (Login)
  Future<UserHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    try {
      return box.values.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null; // Return null if no user is found
    }
  }

  // Clear All Data
  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  // Clear Specific User Box
  Future<void> clearUserBox() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  // Close Hive Database
  Future<void> close() async {
    await Hive.close();
  }
}
