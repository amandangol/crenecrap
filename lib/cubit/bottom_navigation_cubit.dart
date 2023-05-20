import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarMenuChangeCubit extends Cubit<int> {
  BottomNavBarMenuChangeCubit() : super(0);

  void listenBottomNavBarMenuChange(int index) {
    emit(index);
  }
}
