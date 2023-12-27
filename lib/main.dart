import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/Home_page.dart';
import 'package:learn_flutter_bloc/internet/bloc/internet_bloc.dart';
import 'package:learn_flutter_bloc/internet1/cubit/internet1_cubit.dart';
import 'package:learn_flutter_bloc/routes.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Internet1Cubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
          MyRoutes.Homeroute: (context) => HomePage(),
        },
      ),
    );
  }
}
