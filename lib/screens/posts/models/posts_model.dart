// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  const factory PostsModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}
