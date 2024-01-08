import 'package:bloc_asngment/blocs/post_blocs.dart';
import 'package:bloc_asngment/blocs/post_events.dart';
import 'package:bloc_asngment/blocs/post_states.dart';
import 'package:bloc_asngment/repo/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('PostBloc', () {
    final PostRepository postRepository = PostRepository();

    blocTest<PostBloc, PostState>(
      'emits PostLoadingState when LoadPostEvent is added',
      build: () => PostBloc(postRepository),
      act: (bloc) => bloc.add(LoadPostEvent()),
      expect: () => [
        PostLoadingState(),
      ],
    );
  });
}
