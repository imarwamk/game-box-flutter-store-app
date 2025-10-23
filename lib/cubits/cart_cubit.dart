import 'package:bloc/bloc.dart';
import 'package:game_box/model/product.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void addProduct(Product product) {
    final updatedList = List<Product>.from(state);
    updatedList.add(product);
    emit(updatedList);
  }

  void removeProduct(Product product) {
    final updatedList = List<Product>.from(state);
    updatedList.remove(product);
    emit(updatedList);
  }

  void clearCart() {
    emit([]);
  }
}
