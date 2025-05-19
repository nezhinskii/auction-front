import 'package:auction_app/ui/pages/home_page/create_auction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:auction_app/core/auth/auth_provider.dart';
import 'package:auction_app/core/di/service_locator.dart';
import 'package:auction_app/ui/pages/home_page/auction_tile.dart';
import 'package:auction_app/ui/pages/home_page/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late HomeCubit _homeCubit;
  final _scrollControllers = List.generate(3, (_) => ScrollController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _homeCubit = HomeCubit(
      auctionService: ServiceLocator().auctionService,
      signalRService: ServiceLocator().signalRService,
      user: context.read<AuthProvider>().currentUser
    );
    for (var controller in _scrollControllers) {
      controller.addListener(() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 200) {
          _homeCubit.loadAuctions(loadMore: true);
        }
      });
    }
  }

  @override
  void dispose() {
    _homeCubit.close();
    _tabController.dispose();
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person, color: Colors.white, size: 15),
                  const SizedBox(width: 3),
                  Text(
                    context.read<AuthProvider>().currentUser.username,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Text('Auction Hub', style:TextStyle(fontSize: 20),),
            ],
          ),
          centerTitle: true,
          leading:
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                context.read<AuthProvider>().signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false);
              },
            ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                showDialog(

                  context: context,
                  builder: (context) => CreateAuctionDialog(homeCubit: _homeCubit,),
                );
              },
              tooltip: 'Создать аукцион',
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            controller: _tabController,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.white70,
            onTap: (index) => _homeCubit.changeTab(index),
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'My Auctions'),
              Tab(text: 'Participated'),
            ],
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
              loaded: (activeAuctions, myAuctions, participatedAuctions, currentTab) => _tabController.index = currentTab,
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
              loaded: (active, my, participated, tab) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    AuctionList(
                      auctions: active.auctions,
                      totalCount: active.totalCount,
                      pageNumber: active.pageNumber,
                      scrollController: _scrollControllers[0],
                    ),
                    AuctionList(
                      auctions: my.auctions,
                      totalCount: my.totalCount,
                      pageNumber: my.pageNumber,
                      scrollController: _scrollControllers[1],
                    ),
                    AuctionList(
                      auctions: participated.auctions,
                      totalCount: participated.totalCount,
                      pageNumber: participated.pageNumber,
                      scrollController: _scrollControllers[2],
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

class AuctionList extends StatelessWidget {
  final List auctions;
  final int totalCount;
  final int pageNumber;
  final ScrollController scrollController;
  static const int _pageSize = 10;

  const AuctionList({
    super.key,
    required this.auctions,
    required this.totalCount,
    required this.pageNumber,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final isLoadingMore = auctions.length < totalCount;
    if (auctions.isEmpty) {
      return const Center(child: Text('No auctions found'));
    }
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: auctions.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == auctions.length && isLoadingMore) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SpinKitFadingCube(
                color: Colors.orange,
                size: 30,
              ),
            ),
          );
        }
        final auction = auctions[index];
        return AuctionTile(auction: auction);
      },
    );
  }
}