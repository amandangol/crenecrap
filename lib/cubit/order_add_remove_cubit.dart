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
