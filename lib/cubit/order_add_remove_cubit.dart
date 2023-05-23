import 'package:flutter_bloc/flutter_bloc.dart';

class OrderAddRemoveCubit extends Cubit<int> {
  OrderAddRemoveCubit() : super(0);

  void incrementQuantity() {
    emit(state + 1);
  }

  void decrementQuantity() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}

// class CartCubit extends Cubit<List<CartItem>> {
//   CartCubit() : super([]);

//   void addItem(CartItem item) {
//     final updatedCart = [...state];
//     final existingIndex = updatedCart.indexWhere((i) => i.id == item.id);

//     if (existingIndex != -1) {
//       updatedCart[existingIndex].quantity += 1;
//     } else {
//       updatedCart.add(item);
//     }

//     emit(updatedCart);
//   }

//   void removeItem(CartItem item) {
//     final updatedCart = [...state];
//     final existingIndex = updatedCart.indexWhere((i) => i.id == item.id);

//     if (existingIndex != -1) {
//       if (updatedCart[existingIndex].quantity > 1) {
//         updatedCart[existingIndex].quantity -= 1;
//       } else {
//         updatedCart.removeAt(existingIndex);
//       }
//     }

//     emit(updatedCart);
//   }
// }

// class CartItem {
//   final int id;
//   final String name;
//   final double price;
//   int quantity;

//   CartItem({
//     required this.id,
//     required this.name,
//     required this.price,
//     this.quantity = 1,
//   });
// }
