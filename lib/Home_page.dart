import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/internet/bloc/internet_bloc.dart';
import 'package:learn_flutter_bloc/internet1/cubit/internet1_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<Internet1Cubit , Internet1State>(builder: (context, state) {
            if (state is Internet1GainedState) {
              return Text("connected");
            } else if (state is Internet1LostState) {
              return Text("Not connected");
            } else {
              return Text("loading...");
            }
          }, listener: (context, state) {
            if (state is Internet1GainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Internet is connected"),
                backgroundColor: Colors.teal,
              ));
            } else if (state is Internet1LostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Not connected"),
                backgroundColor: Colors.red,
              ));
            }
          }),
        ),
      ),
    );
  }
}
