//post_blocs.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/repositories.dart';
import 'post_events.dart';
import 'post_states.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostLoadingState()) {
    on<LoadPostEvent>(
      ((event, emit) async {
        emit(PostLoadingState());
        try {
          final post = await _postRepository.getPost();
          emit(PostLoadedState(post));
        } catch (e) {
          emit(PostErrorState(e.toString()));
        }
      }),
    );
  }
}
