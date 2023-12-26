import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newzify/features/home/bloc/home_bloc.dart';
import 'package:newzify/features/home/ui/widgets/error_widget.dart';
import 'package:newzify/features/home/ui/widgets/news_list.dart';
import 'package:newzify/features/home/ui/widgets/query_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Newzify",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          QueryWidget(
            homeBloc: homeBloc,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeSuccessState) {
                return NewsList(articles: state.articles);
              } else {
                return const ErrorResponseWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
