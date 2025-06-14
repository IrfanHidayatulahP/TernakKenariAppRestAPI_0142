part of 'profile_buyer_bloc.dart';

sealed class ProfileBuyerEvent {}

class AddProfileBuyerEvent extends ProfileBuyerEvent {
  final BuyerProfileRequestModel requestModel;

  AddProfileBuyerEvent(this.requestModel);
}

class GetProfileBuyerEvent extends ProfileBuyerEvent {}