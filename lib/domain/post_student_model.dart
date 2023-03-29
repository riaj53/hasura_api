import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostStudentModel extends Equatable {
  final String email;
  final String name;
  final int phone;
  PostStudentModel({
    required this.email,
    required this.name,
    required this.phone,
  });

  PostStudentModel copyWith({
    String? email,
    String? name,
    int? phone,
  }) {
    return PostStudentModel(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'phone': phone});
  
    return result;
  }

  factory PostStudentModel.fromMap(Map<String, dynamic> map) {
    return PostStudentModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostStudentModel.fromJson(String source) => PostStudentModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostStudentModel(email: $email, name: $name, phone: $phone)';

  @override
  List<Object> get props => [email, name, phone];
  
}
