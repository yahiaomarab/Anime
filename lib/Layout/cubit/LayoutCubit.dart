import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View/Screens/SecondScreen.dart';
import '../../View/Screens/firstScreen.dart';
import 'LayoutStates.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(IntialLayoutState());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<Widget> Screens = [
    GettingTenQuoteBytitle(),
    GettingSingleQuote(),
  ];
  List<String> Titles = [
    'GettingTenQuoteBytitle',
    'GettingSingleQuote',
  ];

  changeBottomNav(index) {
    CurrentIndex = index;
    emit(ChangingBottomState());
  }
}
