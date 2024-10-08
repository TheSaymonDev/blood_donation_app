import 'package:flutter/material.dart';
import 'package:free_blood_donation/screens/request_screen/widgets/accepted_request_widget.dart';
import 'package:free_blood_donation/screens/request_screen/widgets/my_request_widget.dart';
import 'package:free_blood_donation/widgets/custom_sliver_appbar.dart';
import 'package:get/get.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen>
    with TickerProviderStateMixin {
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
          title: 'bloodRequest',
          tabController: _tabController,
          tabs: [
            Tab(text: 'myRequest'.tr),
            Tab(text: 'acceptedRequest'.tr),
          ],
          onLeadingPressed: () {
            // Define your leading button action here
          },
        )
      ],
      body: TabBarView(
        controller: _tabController,
        children: const [
          MyRequestWidget(),
          AcceptedRequestWidget(),
        ],
      ),
    );
  }
}
