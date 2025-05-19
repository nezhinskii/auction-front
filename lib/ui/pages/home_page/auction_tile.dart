import 'package:auction_app/ui/pages/auction_page/auction_page.dart';
import 'package:auction_app/ui/pages/home_page/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/core/network/dio_client.dart';
import 'package:auction_app/domain/models/auction/auction.dart';

class AuctionTile extends StatefulWidget {
  final Auction auction;

  const AuctionTile({super.key, required this.auction});

  @override
  _AuctionTileState createState() => _AuctionTileState();
}

class _AuctionTileState extends State<AuctionTile> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().currentUser;
    final isOwner = user.id == widget.auction.ownerId;
    final isWinner = user.id == widget.auction.winnerId;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (innerContext) => AuctionPage(
              auction: widget.auction,
              onParticipate: (auction) {
                context.read<HomeCubit>().participate(auction);
              },
            ),
          ),
        );
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: isWinner
                ? BorderSide(color: Colors.green[400]!, width: 2)
                : isOwner ? BorderSide(color: Colors.indigo[400]!, width: 2)
                          : BorderSide(color: Colors.grey[200]!, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: widget.auction.imageUrl != null
                    ? CachedNetworkImage(
                      imageUrl: "${DioClient.getBaseUrl()}${widget.auction.imageUrl!}",
                      width: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: SpinKitFadingCube(
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ) : Container(
                      width: 100,
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.auction.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigo[700],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getStatusColor(widget.auction.status, context),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.auction.status,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.auction.description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        if (widget.auction.price != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '\$${widget.auction.price!.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange[400],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              if (isOwner)
                                const Icon(
                                  Icons.person,
                                  color: Colors.indigo,
                                  size: 18,
                                ),
                              Text(
                                'Owner: ${isOwner ? 'You': widget.auction.ownerUsername}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isOwner ? Colors.indigo[600] : Colors.grey[600] ,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Created: ${_formatDate(widget.auction.createdAt)}',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status, BuildContext context) {
    switch (status) {
      case 'Open':
        return Theme.of(context).colorScheme.secondary; // Orange
      case 'Closing':
        return Colors.red[400]!;
      case 'Sold':
        return Colors.purple[400]!;
      default:
        return Colors.grey[400]!;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}