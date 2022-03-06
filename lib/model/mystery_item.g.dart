// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mystery_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MysteryItem _$$_MysteryItemFromJson(Map<String, dynamic> json) =>
    _$_MysteryItem(
      id: json['id'] as int,
      kind: json['kind'] as String,
      isResolved: json['isResolved'] as bool,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$_MysteryItemToJson(_$_MysteryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'isResolved': instance.isResolved,
      'imagePath': instance.imagePath,
    };
