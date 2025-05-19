import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/domain/models/bid/bid.dart';

class BidTile extends StatelessWidget {
  final Bid bid;

  const BidTile({super.key, required this.bid});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().user;
    final isOwnBid = user != null && user.id == bid.userId;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isOwnBid ? Colors.orange[50] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOwnBid ? Colors.orange[200]! : Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isOwnBid ? Icons.person : Icons.gavel,
            color: isOwnBid ? Colors.orange[400] : Colors.grey[600],
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isOwnBid ? 'You' : bid.userName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isOwnBid ? Colors.orange[700] : Colors.indigo[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${bid.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.indigo[700],
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatDate(bid.bidTime),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}