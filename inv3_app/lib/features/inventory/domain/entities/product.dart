import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Product extends Equatable
// Equatable helps to value equality such as dart only supports referential equality
{
  final int? id;
  final String? name;
  final String? category;
  final Decimal? price;
  final Decimal? unitaryCost;
  final int? quantity;

  const Product
  ({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.unitaryCost,
    @required this.category,
    @required this.quantity
  });

  @override
  List<Object?> get props => [id, name, category, price, unitaryCost, quantity];
}
