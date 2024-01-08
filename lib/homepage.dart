//homepage.dart
import 'package:bloc_asngment/blocs/app_blocs.dart';
import 'package:bloc_asngment/blocs/app_events.dart';
import 'package:bloc_asngment/blocs/app_states.dart';
import 'package:bloc_asngment/model/app_model.dart';
import 'package:bloc_asngment/repo/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void saveImageToLocalDB(ImageModel image) async {
    await Hive.openBox('images');
    var imagesBox = Hive.box('images');
    imagesBox.add(image.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(
          create: (BuildContext context) => ImageBloc(ImageRepository()),
        ),
      ],
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ImageBloc(
            ImageRepository(),
          )..add(LoadImageEvent()),
          child: BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
            if (state is ImageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ImageLoadedState) {
              List<ImageModel> imageList = state.image;
              return ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Card(
                          color: Theme.of(context).primaryColor,
                          child: Image.network(
                            imageList[index].url.toString(),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          // Save the image to local database using Hive
                          saveImageToLocalDB(state.image.first);
                          // Navigate to Screen 2
                          Navigator.pushNamed(context, '/screen2');
                        },
                        child: Icon(Icons.save),
                      )
                    ],
                  );
                },
              );
            }
            if (state is ImageErrorState) {
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
