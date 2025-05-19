import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_bid_dto.freezed.dart';
part 'place_bid_dto.g.dart';

@freezed
class PlaceBidDto with _$PlaceBidDto {
  const factory PlaceBidDto({
    required double amount,
  }) = _PlaceBidDto;

  factory PlaceBidDto.fromJson(Map<String, dynamic> json) => _$PlaceBidDtoFromJson(json);
}