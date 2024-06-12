import 'package:flutter/material.dart';
import 'package:free_blood_donation/screens/feed_screen/widgets/blood_donor.dart';
import 'package:free_blood_donation/screens/feed_screen/widgets/blood_seeker.dart';
import 'package:free_blood_donation/widgets/custom_sliver_appbar.dart';
import 'package:get/get.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomSliverAppBar(
          title: 'newsFeed',
          tabController: _tabController,
          tabs: [
            Tab(text: 'bloodSeeker'.tr),
            Tab(text: 'bloodDonor'.tr),
          ],
          onLeadingPressed: () {
            // Define your leading button action here
          },
        )
      ],
      body: TabBarView(
        controller: _tabController,
        children: const [
          BloodSeeker(),
          BloodDonor(),
        ],
      ),
    );
  }
}
