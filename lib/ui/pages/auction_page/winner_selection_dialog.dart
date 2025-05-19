import 'package:auction_app/domain/models/bid/bid.dart';
import 'package:flutter/material.dart';

class WinnerSelectionDialog extends StatelessWidget {
  const WinnerSelectionDialog({super.key, required this.bids, required this.onSell});
  final List<Bid> bids;
  final Function(int bidId) onSell;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Winner',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: bids.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(bids[index].userName),
                  subtitle: Text('\$${bids[index].amount.toStringAsFixed(2)}'),
                  onTap: () {
                    onSell.call(bids[index].id);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
