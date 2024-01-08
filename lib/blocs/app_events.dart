//app_events.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ImageEvent extends Equatable {
  const ImageEvent();
}

class LoadImageEvent extends ImageEvent {
  @override
  List<Object?> get props => [];
}