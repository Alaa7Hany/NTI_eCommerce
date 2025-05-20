import '../../data/models/sliders_response_model.dart';

abstract class SlidersState {}

class SlidersInitial extends SlidersState {}

class SlidersLoading extends SlidersState {}

class SlidersLoaded extends SlidersState {
  final List<SliderModel> sliders;
  SlidersLoaded(this.sliders);
}

class SlidersError extends SlidersState {
  final String error;
  SlidersError(this.error);
}

class SlidersEmpty extends SlidersState {}
