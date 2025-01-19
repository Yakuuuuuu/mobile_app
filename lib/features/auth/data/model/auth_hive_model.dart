import 'package:equatable/equatable.dart';
import 'package:hamroBooking/app/constants/hive_table_constant.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_app/app/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(
    typeId:
        HiveTableConstant.userTableId) // Replace 1 with the appropriate type ID
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  // @HiveField(3)
  // final bool isAdmin;

  UserHiveModel({
    String? id,
    required this.email,
    required this.password,
    // this.isAdmin = false,
  }) : id = id ?? const Uuid().v4();

  // Initial Constructor
  const UserHiveModel.initial()
      : id = '',
        email = '',
        password = '';
  // isAdmin = false;

  // From Entity as JSOn
  factory UserHiveModel.fromJson(Map<String, dynamic> json) {
    return UserHiveModel(
      id: json['id'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      // isAdmin: json['isAdmin'] as bool? ?? false,
    );
  }

  // To Entity as JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      // 'isAdmin': isAdmin,
    };
  }

  @override
  List<Object?> get props => [id, email, password];
}
