import 'package:json_annotation/json_annotation.dart';
import 'package:maka_tht/models/item.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale {
   Item item;

   Sale({required this.item});

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);
  Map<String, dynamic> toJson() => _$SaleToJson(this);
}