import 'package:json_annotation/json_annotation.dart';
import 'package:maka_tht/models/item.dart';
import 'package:maka_tht/models/sale.dart';

part 'show.g.dart';

@JsonSerializable()
class Show {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Sale>? sales = [];

  List<Item> get getSalesItems  => sales?.map((s) => s.item).toList() ?? [];

  Show({this.id, this.name, this.createdAt, this.updatedAt, this.sales});

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
  Map<String, dynamic> toJson() => _$ShowToJson(this);
}