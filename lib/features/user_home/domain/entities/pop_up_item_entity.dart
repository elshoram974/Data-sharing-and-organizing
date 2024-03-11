import 'package:equatable/equatable.dart';


final class HomePopUpItemEntity<T> extends Equatable {
  final T value;
  final String text;
  final bool isVisible;

  const HomePopUpItemEntity({
    required this.text,
    required this.value,
    required this.isVisible,
  });
  @override
  List<Object?> get props => [value, text];
}
