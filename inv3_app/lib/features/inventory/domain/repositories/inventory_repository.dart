import 'package:dartz/dartz.dart';
import 'package:inv3_app/core/error/failures.dart';
import 'package:inv3_app/features/inventory/domain/entities/expense.dart';
import 'package:inv3_app/features/inventory/domain/entities/product.dart';
import 'package:inv3_app/features/inventory/domain/entities/sale.dart';

abstract class InventoryRepository {
  Future<Either<Failure,List<Product>>> getProducts();
  Future<Either<Failure,Product>> getOneProduct(int id);
  Future<Either<Failure,String>> postProduct(Product product);
  putProduct(Product product);
  patchProduct(Product product);
  deleteProduct(Product product);

  getSales(Sale sale);
  getOneSale(Sale sale);
  postSale(Sale sale);
  putSale(Sale sale);
  patchSale(Sale sale);
  deleteSale(Sale sale);

  getExpenses(Expense expense);
  getOneExpense(Expense expense);
  postExpense(Expense expense);
  putExpense(Expense expense);
  patchExpense(Expense expense);
  deleteExpense(Expense expense);
}
