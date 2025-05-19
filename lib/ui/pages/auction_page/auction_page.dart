import 'package:auction_app/ui/pages/auction_page/winner_selection_dialog.dart';
import 'package:auction_app/ui/pages/home_page/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/core/di/service_locator.dart';
import 'package:auction_app/core/network/dio_client.dart';
import 'package:auction_app/domain/models/auction/auction.dart';
import 'package:auction_app/domain/models/bid/bid.dart';
import 'package:auction_app/ui/pages/auction_page/auction_cubit.dart';
import 'package:auction_app/ui/pages/auction_page/bid_tile.dart';

class AuctionPage extends StatefulWidget {
  final Auction auction;
  final Function(Auction auction) onParticipate;
  const AuctionPage({super.key, required this.auction, required this.onParticipate});

  @override
  AuctionPageState createState() => AuctionPageState();
}

class AuctionPageState extends State<AuctionPage> with SingleTickerProviderStateMixin {
  late final AuctionCubit _cubit;
  final _bidAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit = AuctionCubit(
      auctionService: ServiceLocator().auctionService,
      signalRService: ServiceLocator().signalRService,
      auctionId: widget.auction.id,
    );
  }

  @override
  void dispose() {
    _bidAmountController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().currentUser;

    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.auction.title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo[700],
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: BlocConsumer<AuctionCubit, AuctionState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: SpinKitFadingCube(
                  color: Colors.orange,
                  size: 40,
                ),
              ),
              loaded: (auction, bids) {
                final isOwner = user.id == auction.ownerId;
                final isWinner = user.id == auction.winnerId;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: auction.imageUrl != null
                          ? CachedNetworkImage(
                            imageUrl: "${DioClient.getBaseUrl()}${auction.imageUrl!}",
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const Center(
                              child: SpinKitFadingCube(
                                color: Colors.orange,
                                size: 30,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                              Container(
                                height: 220,
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: const Icon(Icons.error, color: Colors.red),
                              ),
                          ) : Container(
                            height: 220,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: const Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: isWinner ? BorderSide(color: Colors.green[400]!, width: 2)
                                : isOwner ? BorderSide(color: Colors.indigo[400]!, width: 2)
                                : BorderSide(color: Colors.grey[200]!, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        auction.title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo[700],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(
                                            auction.status, context),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        auction.status,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  auction.description,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                const SizedBox(height: 8),
                                if (auction.price != null)
                                  Text(
                                    '\$${auction.price!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange[400],
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (isOwner)
                                      const Icon(
                                        Icons.person,
                                        color: Colors.indigo,
                                        size: 18,
                                      ),
                                    Text('Owner: ${isOwner ? 'You' : auction.ownerUsername}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isOwner
                                            ? Colors.indigo[600]
                                            : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (auction.winnerUsername != null)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text('Winner: ${isWinner ? 'You' : auction.winnerUsername}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isWinner
                                            ? Colors.green[600]
                                            : Colors.grey[600],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                Text(
                                  'Created: ${_formatDate(auction.createdAt)}',
                                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _AuctionActions(
                          auction: auction,
                          bids: bids,
                          isOwner: isOwner,
                          onParticipate: widget.onParticipate,
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bids',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            bids.isEmpty ? const Center(child: Text('No bids yet')) : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: bids.length,
                              itemBuilder: (context, index) {
                                return BidTile(bid: bids[index]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
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

class _AuctionActions extends StatefulWidget {
  const _AuctionActions({super.key, required this.auction, required this.isOwner, required this.bids, required this.onParticipate});
  final Auction auction;
  final List<Bid> bids;
  final bool isOwner;
  final Function(Auction auction) onParticipate;

  @override
  State<_AuctionActions> createState() => _AuctionActionsState();
}

class _AuctionActionsState extends State<_AuctionActions> {
  final _bidAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if ((widget.auction.status != 'Open' && !widget.isOwner) || (widget.auction.status == 'Sold' && widget.isOwner)) {
      return const SizedBox.shrink();
    }

    if (widget.isOwner) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.auction.status == 'Open')
          ElevatedButton(
            onPressed: () => context.read<AuctionCubit>().closeAuction(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Close Auction'),
          ),
          const SizedBox(height: 8),
          if (widget.bids.isNotEmpty && widget.auction.status == 'Closing')
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (innerContext) => WinnerSelectionDialog(
                    bids: widget.bids,
                    onSell: (bidId) {
                      context.read<AuctionCubit>().sellAuction(bidId);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[400],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Sell Auction'),
            ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: TextField(
              controller: _bidAmountController,
              decoration: InputDecoration(
                labelText: 'Bid Amount',
                prefixIcon: Icon(Icons.attach_money, color: Colors.orange[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(_bidAmountController.text);
              if (amount != null && amount > 0) {
                context.read<AuctionCubit>().placeBid(amount);
                widget.onParticipate(widget.auction);
                _bidAmountController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Enter a valid bid amount')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[400],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Place Bid'),
          ),
        ],
      );
    }
    return const Placeholder();
  }
}
