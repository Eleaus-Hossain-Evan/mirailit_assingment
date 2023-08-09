import 'dart:convert';

import 'package:equatable/equatable.dart';

class StoryResponse extends Equatable {
  final int story_count;
  final List<String> images;
  const StoryResponse({
    required this.story_count,
    required this.images,
  });

  StoryResponse copyWith({
    int? story_count,
    List<String>? images,
  }) {
    return StoryResponse(
      story_count: story_count ?? this.story_count,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'story_count': story_count,
      'images': images,
    };
  }

  factory StoryResponse.fromMap(Map<String, dynamic> map) {
    return StoryResponse(
      story_count: map['story_count']?.toInt() ?? 0,
      images: List<String>.from(map['images'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryResponse.fromJson(String source) =>
      StoryResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'StoryResponse(story_count: $story_count, images: $images)';

  @override
  List<Object> get props => [story_count, images];
}
