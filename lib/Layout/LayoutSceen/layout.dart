import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../cubit/LayoutCubit.dart';
import '../cubit/LayoutStates.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 10,
            title: Text(
              '${LayoutCubit.get(context).Titles[LayoutCubit.get(context).CurrentIndex]}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
          ),
          body: LayoutCubit.get(context)
              .Screens[LayoutCubit.get(context).CurrentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                color: Colors.green[100],
              ),
              child: GNav(
                rippleColor:
                    Colors.white, // tab button ripple color when pressed
                hoverColor: Colors.white, // tab button hover color
                haptic: true, // haptic feedback
                tabBorderRadius: 15,
                curve: Curves.easeOutExpo, // tab animation curves
                duration: const Duration(milliseconds: 200),
                gap: 8,
                color: Colors.black,
                activeColor: Colors.black,
                iconSize: 24,
                tabBackgroundColor: Colors.green[200]!,
                padding: const EdgeInsets.symmetric(
                    horizontal: 70, vertical: 5), // navigation bar padding
                tabs: const [
                  GButton(
                    icon: Icons.sentiment_very_dissatisfied,
                    text: 'Ten',
                  ),
                  GButton(
                    icon: Icons.sentiment_very_satisfied_rounded,
                    text: 'Single',
                  ),
                ],
                onTabChange: (int index) {
                  LayoutCubit.get(context).changeBottomNav(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
