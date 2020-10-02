import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcpartpicker/screens/home.dart';

import 'bloc/apiBloc/api_bloc.dart';

void main() async {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => ApiBloc())],
      child: HomePage()));
}
