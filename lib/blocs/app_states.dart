import 'package:bloc_asngment/model/app_model.dart';
import 'package:equatable/equatable.dart';

abstract class ImageState extends Equatable {}

class ImageLoadingState extends ImageState {
  @override
  List<Object?> get props => [];
}

class ImageLoadedState extends ImageState {
  final List<ImageModel> image;
  ImageLoadedState(this.image);
  @override
  List<Object?> get props => [image];
}

class ImageErrorState extends ImageState {
  final String error;
  ImageErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
