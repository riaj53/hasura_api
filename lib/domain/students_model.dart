import 'dart:convert';

import 'package:equatable/equatable.dart';

class StudentsModel extends Equatable {
  final int id;
  final String email;
  final String name;
  final int phone;
  const StudentsModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  StudentsModel copyWith({
    int? id,
    String? email,
    String? name,
    int? phone,
  }) {
    return StudentsModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'phone': phone});

    return result;
  }

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentsModel.fromJson(String source) =>
      StudentsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentsModel(id: $id, email: $email, name: $name, phone: $phone)';
  }

  @override
  List<Object> get props => [id, email, name, phone];
  factory StudentsModel.init() =>
      StudentsModel(id: 0, email: '', name: '', phone: 0);
}
