import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String serialId;
  final String address;
  final String image;
  final String pickupStyle;
  final String defaultPayment;
  final String paymentStyle;
  final bool isDisabled;
  final String role;
  final String name;
  final String email;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final bool isApproved;
  final String token;

  const UserModel({
    required this.id,
    required this.serialId,
    required this.address,
    required this.image,
    required this.pickupStyle,
    required this.defaultPayment,
    required this.paymentStyle,
    required this.isDisabled,
    required this.role,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.isApproved,
    required this.token,
  });

  factory UserModel.init() => const UserModel(
        id: '',
        serialId: '',
        address: '',
        image: '',
        pickupStyle: '',
        defaultPayment: '',
        paymentStyle: '',
        isDisabled: false,
        role: '',
        name: '',
        email: '',
        phone: '',
        createdAt: '',
        updatedAt: '',
        isApproved: false,
        token: '',
      );

  UserModel copyWith({
    String? id,
    String? serialId,
    String? address,
    String? image,
    String? pickupStyle,
    String? defaultPayment,
    String? paymentStyle,
    bool? isDisabled,
    String? role,
    String? name,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    bool? isApproved,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      serialId: serialId ?? this.serialId,
      address: address ?? this.address,
      image: image ?? this.image,
      pickupStyle: pickupStyle ?? this.pickupStyle,
      defaultPayment: defaultPayment ?? this.defaultPayment,
      paymentStyle: paymentStyle ?? this.paymentStyle,
      isDisabled: isDisabled ?? this.isDisabled,
      role: role ?? this.role,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isApproved: isApproved ?? this.isApproved,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serialId': serialId,
      'address': address,
      'image': image,
      'pickupStyle': pickupStyle,
      'defaultPayment': defaultPayment,
      'paymentStyle': paymentStyle,
      'isDisabled': isDisabled,
      'role': role,
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isApproved': isApproved,
      'token': token,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      "name": name,
      "address": address,
      "hubId": "",
      "pickupStyle": pickupStyle,
      "defaultPayment": defaultPayment,
      "paymentStyle": paymentStyle,
      
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      serialId: map['serialId'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
      pickupStyle: map['pickupStyle'] ?? '',
      defaultPayment: map['defaultPayment'] ?? '',
      paymentStyle: map['paymentStyle'] ?? '',
      isDisabled: map['isDisabled'] ?? false,
      role: map['role'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      isApproved: map['isApproved'] ?? false,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, serialId: $serialId, address: $address, image: $image, pickupStyle: $pickupStyle, defaultPayment: $defaultPayment, paymentStyle: $paymentStyle, isDisabled: $isDisabled, role: $role, name: $name, email: $email, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, isApproved: $isApproved, token: $token)';
  }

  @override
  List<Object> get props {
    return [
      id,
      serialId,
      address,
      image,
      pickupStyle,
      defaultPayment,
      paymentStyle,
      isDisabled,
      role,
      name,
      email,
      phone,
      createdAt,
      updatedAt,
      isApproved,
      token,
    ];
  }
}
