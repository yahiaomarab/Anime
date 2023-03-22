import 'package:anime/View_Model/api_Cubit/api_Cubit.dart';
import 'package:anime/View_Model/api_Cubit/api_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widgets/Widgets.dart';

class GettingSingleQuote extends StatelessWidget {
  const GettingSingleQuote({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getRequest(context),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Item(context,AppCubit.get(context).quoteModel!),
          );
        },
      ),
    );
  }
}