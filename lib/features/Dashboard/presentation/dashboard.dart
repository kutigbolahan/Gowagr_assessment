import 'package:flutter/material.dart';



class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/qalla_logo.png', // Replace with your logo asset
                    height: 32,
                  ),
                  const Icon(Icons.more)
                ],
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Text("Explore", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(width: 24),
                  Text("Portfolio", style: TextStyle(fontSize: 18, color: Colors.grey)),
                  SizedBox(width: 24),
                  Text("Activity", style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for a market',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _FilterChip(label: 'Trending', icon: Icons.track_changes, selected: true),
                  const SizedBox(width: 10),
                  _FilterChip(label: 'Watchlist', icon: Icons.bookmark),
                  const SizedBox(width: 10),
                  _FilterChip(label: 'Entertainment', icon: Icons.music_note),
                  const SizedBox(width: 10),
                  _FilterChip(label: 'Sports', icon: Icons.sports_soccer),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: const [
                    MarketCard(
                      title: "HEIS Delux before Q2, 2025",
                      avatar: 'assets/heis.png',
                      yesPrice: "₦80",
                      noPrice: "₦20",
                      yesReturn: "₦22k",
                      noReturn: "₦15k",
                      trades: 129,
                      endDate: "Ends 14th Oct."
                    ),
                    SizedBox(height: 16),
                    HeadiesCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  const _FilterChip({required this.label, required this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: selected ? Colors.white : Colors.black),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: selected ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  final String title;
  final String avatar;
  final String yesPrice;
  final String noPrice;
  final String yesReturn;
  final String noReturn;
  final int trades;
  final String endDate;

  const MarketCard({
    super.key,
    required this.title,
    required this.avatar,
    required this.yesPrice,
    required this.noPrice,
    required this.yesReturn,
    required this.noReturn,
    required this.trades,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Center(child: Text("Buy Yes - $yesPrice", style: TextStyle(color: Colors.blue))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Center(child: Text("Buy No - $noPrice", style: TextStyle(color: Colors.red))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("₦10k  →  $yesReturn", style: const TextStyle(color: Colors.green)),
              Text("₦10k  →  $noReturn", style: const TextStyle(color: Colors.green)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.bar_chart, size: 16),
              const SizedBox(width: 4),
              Text("$trades Trades"),
              const Spacer(),
              Text(endDate, style: const TextStyle(color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}

class HeadiesCard extends StatelessWidget {
  const HeadiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/headies.png'),
                radius: 20,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("Who Wins Headies Next Rated Award 2024?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _VoteRow(name: "Odumodublvck", yes: "₦55", no: "₦45"),
          const SizedBox(height: 10),
          _VoteRow(name: "Shallipopi", yes: "₦45", no: "₦55"),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.bar_chart, size: 16),
              const SizedBox(width: 4),
              const Text("₦1.5M"),
              const Spacer(),
              const Text("Ends 14th Oct.", style: TextStyle(color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}

class _VoteRow extends StatelessWidget {
  final String name;
  final String yes;
  final String no;
  const _VoteRow({required this.name, required this.yes, required this.no});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(name)),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(6),
              color: Colors.blue.shade50,
            ),
            child: Center(child: Text("Yes $yes", style: const TextStyle(color: Colors.blue))),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(6),
              color: Colors.red.shade50,
            ),
            child: Center(child: Text("No $no", style: const TextStyle(color: Colors.red))),
          ),
        ),
      ],
    );
  }
}
