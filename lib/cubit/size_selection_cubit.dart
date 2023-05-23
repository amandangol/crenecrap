import 'package:flutter_bloc/flutter_bloc.dart';

class SizeSelectionCubit extends Cubit<SizeSelectionState> {
  SizeSelectionCubit() : super(SizeSelectionState(''));

  void selectSize(String size) {
    emit(SizeSelectionState(size));
  }

  void unselectSize() {
    emit(SizeSelectionState(''));
  }
}

class SizeSelectionState {
  final String selectedSize;

  SizeSelectionState(this.selectedSize);
}
