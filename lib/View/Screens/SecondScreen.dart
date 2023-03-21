import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../View_Model/cubit/Cubit.dart';
import '../../View_Model/cubit/States.dart';
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