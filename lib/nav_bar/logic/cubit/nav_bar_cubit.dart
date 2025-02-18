import 'package:bloc/bloc.dart';


class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(0);
  changePage(int index) => emit(index);
}
