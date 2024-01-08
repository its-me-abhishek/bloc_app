import 'package:bloc_asngment/blocs/post_blocs.dart';
import 'package:bloc_asngment/blocs/post_events.dart';
import 'package:bloc_asngment/blocs/post_states.dart';
import 'package:bloc_asngment/model/post_model.dart';
import 'package:bloc_asngment/repo/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (BuildContext context) => PostBloc(PostRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: BlocProvider(
          create: (context) => PostBloc(
            PostRepository(),
          )..add(LoadPostEvent()),
          child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              List<PostModel> postList = state.post;
              return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      postList[index].title.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(postList[index].body.toString()),
                  );
                },
              );
            }
            if (state is PostErrorState) {
              return const Center(
                child: Text("Error"),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
