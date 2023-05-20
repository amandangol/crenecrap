import 'package:flutter_bloc/flutter_bloc.dart';

class SizeSelectionCubit extends Cubit<SizeSelectionState> {
  SizeSelectionCubit() : super(SizeSelectionState.initial);

  void selectSize() => emit(SizeSelectionState.selected);

  void resetSize() => emit(SizeSelectionState.initial);
}

enum SizeSelectionState {
  initial,
  selected,
}
