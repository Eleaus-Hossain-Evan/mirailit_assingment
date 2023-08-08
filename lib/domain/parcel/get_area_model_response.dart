import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../auth/model/area_model.dart';

class GetAreaModelResponse extends Equatable {
  final List<AreaModel> data;
  final bool success;
  final String message;
  const GetAreaModelResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  GetAreaModelResponse copyWith({
    List<AreaModel>? data,
    bool? success,
    String? message,
  }) {
    return GetAreaModelResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'success': success,
      'message': message,
    };
  }

  factory GetAreaModelResponse.fromMap(Map<String, dynamic> map) {
    return GetAreaModelResponse(
      data: List<AreaModel>.from(
          map['data']?.map((x) => AreaModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAreaModelResponse.fromJson(String source) =>
      GetAreaModelResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'GetAreaModelResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
