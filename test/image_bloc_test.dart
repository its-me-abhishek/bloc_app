import 'package:bloc_asngment/blocs/app_blocs.dart';
import 'package:bloc_asngment/blocs/app_events.dart';
import 'package:bloc_asngment/blocs/app_states.dart';
import 'package:bloc_asngment/repo/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('ImageBloc', () {
    final ImageRepository imageRepository = ImageRepository();

    blocTest<ImageBloc, ImageState>(
      'emits ImageLoadingState when LoadImageEvent is added',
      build: () => ImageBloc(imageRepository),
      act: (bloc) => bloc.add(LoadImageEvent()),
      expect: () => [
        ImageLoadingState(),
      ],
    );
  });
}
