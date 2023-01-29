// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_slide_controller_state.dart';

class OnboardingSlideControllerCubit
    extends Cubit<OnboardingSlideControllerState> {
  OnboardingSlideControllerCubit()
      : super(
          OnboardingSlideControllerState(0),
        );

  void loadNext() {
    emit(OnboardingSlideControllerState(
      ++state.activeElementIndex,
    ));
  }

  void loadPrevious() => emit(OnboardingSlideControllerState(
        --state.activeElementIndex,
      ));

  void loadElement(int elementIndex) => emit(OnboardingSlideControllerState(
        state.activeElementIndex = elementIndex,
      ));
}
