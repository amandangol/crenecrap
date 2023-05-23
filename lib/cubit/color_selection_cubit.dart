import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorSelectionCubit extends Cubit<ColorSelectionState> {
  ColorSelectionCubit() : super(ColorSelectionState(Colors.transparent, false));

  void selectColor(Color color) {
    emit(ColorSelectionState(color, true));
  }

  void unselectColor() {
    emit(ColorSelectionState(Colors.transparent, false));
  }
}

class ColorSelectionState {
  final Color selectedColor;
  final bool isSelected;

  ColorSelectionState(this.selectedColor, this.isSelected);
}
