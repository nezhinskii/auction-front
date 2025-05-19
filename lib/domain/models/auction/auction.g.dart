// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuctionImpl _$$AuctionImplFromJson(Map<String, dynamic> json) =>
    _$AuctionImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      imageUrl: json['imageUrl'] as String?,
      ownerId: (json['ownerId'] as num).toInt(),
      ownerUsername: json['ownerUsername'] as String,
      winnerId: (json['winnerId'] as num?)?.toInt(),
      winnerUsername: json['winnerUsername'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AuctionImplToJson(_$AuctionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'ownerId': instance.ownerId,
      'ownerUsername': instance.ownerUsername,
      'winnerId': instance.winnerId,
      'winnerUsername': instance.winnerUsername,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'price': instance.price,
    };
