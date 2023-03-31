// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      itemID: json['itemID'] as int,
      itemName: json['itemName'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'itemID': instance.itemID,
      'itemName': instance.itemName,
      'quantity': instance.quantity,
    };
