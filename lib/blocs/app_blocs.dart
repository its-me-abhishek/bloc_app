//app_blocs.dart
import '../blocs/app_events.dart';
import '../blocs/app_states.dart';
import '../repo/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository _imageRepository;

  ImageBloc(this._imageRepository) : super(ImageLoadingState()) {
    on<LoadImageEvent>(
      ((event, emit) async {
        emit(ImageLoadingState());
        try {
          final image = await _imageRepository.getImage();
          emit(ImageLoadedState(image));
        } catch (e) {
          emit(ImageErrorState(e.toString()));
        }
      }),
    );
  }
}
