import 'package:anime/View_Model/api_Cubit/api_Cubit.dart';
import 'package:anime/View_Model/api_Cubit/api_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widgets/Widgets.dart';

class GettingTenQuoteBytitle extends StatelessWidget {
  const GettingTenQuoteBytitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getRequest(context),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ListView.separated(
                 physics: const BouncingScrollPhysics(),
                 itemBuilder: (context, index) {
                 return Item(context, AppCubit.get(context).quotes[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 7,
              ),
              itemCount: AppCubit.get(context).quotes.length,
            ),

          );
        },
      ),
    );
  }
}
