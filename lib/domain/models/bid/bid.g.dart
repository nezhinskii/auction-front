// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BidImpl _$$BidImplFromJson(Map<String, dynamic> json) => _$BidImpl(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      userId: (json['userId'] as num).toInt(),
      auctionId: (json['auctionId'] as num).toInt(),
      userName: json['userName'] as String,
      bidTime: DateTime.parse(json['bidTime'] as String),
    );

Map<String, dynamic> _$$BidImplToJson(_$BidImpl instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'userId': instance.userId,
      'auctionId': instance.auctionId,
      'userName': instance.userName,
      'bidTime': instance.bidTime.toIso8601String(),
    };
