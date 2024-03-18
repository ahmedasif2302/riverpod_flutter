// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostsModelImpl _$$PostsModelImplFromJson(Map<String, dynamic> json) =>
    _$PostsModelImpl(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$PostsModelImplToJson(_$PostsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
    };
