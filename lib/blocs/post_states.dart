// post_states.dart
import 'package:equatable/equatable.dart';
import '../model/post_model.dart';

abstract class PostState extends Equatable {}

class PostLoadingState extends PostState {
  @override
  List<Object?> get props => [];
}

class PostLoadedState extends PostState {
  final List<PostModel> post;
  PostLoadedState(this.post);
  @override
  List<Object?> get props => [post];
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
