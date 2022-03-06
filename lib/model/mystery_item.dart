import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mystery_item.freezed.dart';

part 'mystery_item.g.dart';

@freezed
class MysteryItem with _$MysteryItem {
  const factory MysteryItem({
    required int id,
    required String kind,
    required bool isResolved,
    required String imagePath,
  }) = _MysteryItem;

  factory MysteryItem.fromJson(Map<String, dynamic> json) =>
      _$MysteryItemFromJson(json);
}
