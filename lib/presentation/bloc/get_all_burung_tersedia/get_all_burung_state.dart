part of 'get_all_burung_bloc.dart';

sealed class GetAllBurungState {}

final class GetAllBurungInitial extends GetAllBurungState {}

final class GetAllBurungLoading extends GetAllBurungState {}

final class GetBurungTersediaLoaded extends GetAllBurungState {
  final BurungSemuaTersediaModel burungTersedia;

  GetBurungTersediaLoaded(this.burungTersedia);
}

final class GetBurungTersediaError extends GetAllBurungState {
  final String message;

  GetBurungTersediaError(this.message);
}