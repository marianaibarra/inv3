import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:inv3_app/features/inventory/domain/entities/product.dart';
import 'package:inv3_app/features/inventory/domain/entities/provider.dart';
import 'package:meta/meta.dart';
///
///
///
class Expense extends Equatable
// Equatable helps to value equality such as dart only supports referential equality
{
  final int? id;
  final DateTime? date;
  final String? payMethod;
  final Provider? provider;
  final Decimal? spent;
  final Product? product;

  const Expense({
  @required this.id, 
  @required this.date, 
  @required this.payMethod, 
            this.provider, 
  @required this.spent, 
            this.product
  });

  @override
  List<Object?> get props => [id, date, payMethod, provider, spent, product];
}
