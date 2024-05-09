import 'package:estibafy_company_app/UI/widgets/Orders%20Widgets/empty_message.dart';
import 'package:estibafy_company_app/controllers/order_controller.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/components.dart';
import '../../models/company_jobs_model.dart';
import '../widgets/Orders Widgets/jobCardWidget.dart';

class Jobs extends StatefulWidget {
  const Jobs({super.key});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int tabIndex = 0;

  final orderController = Get.put(OrderController());

  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = const [
    Tab(text: 'Accepted'),
    Tab(text: 'In Process'),
    Tab(text: 'Completed'),
    Tab(
      text: 'Cancelled',
    )
  ];

  @override
  void initState() {
    orderController.getOrders();
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "JOBS".toUpperCase(),
                style: titleTextStyle,
              ),
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primaryColor,
                onTap: (value) {
                  setState(() {
                    tabIndex = value;
                  });
                },
                unselectedLabelColor: _unselectedColor,
                labelStyle: GoogleFonts.robotoCondensed(
                  fontSize: 16,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const MaterialDesignIndicator(
                    indicatorHeight: 4, indicatorColor: AppColors.primaryColor),
                tabs: _tabs,
              ),
              Expanded(
                child: Obx(
                  () => orderController.companyJobs.value.success == null
                      ? const Center(
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              )))
                      : orderController.getListLength(tabIndex) == 0
                          ? const EmptyMessage()
                          : ListView.builder(
                              itemCount: orderController.getListLength(tabIndex),
                              itemBuilder: (context, index) {
                                return JobCardWidget(
                                  job:
                                      orderController.getSelectedList(index, tabIndex) ?? JobData(),
                                  jobStatus: 'accepted',
                                );
                              }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialDesignIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const MaterialDesignIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  createBoxPainter([VoidCallback? onChanged]) {
    return _MaterialDesignPainter(this, onChanged);
  }
}

class _MaterialDesignPainter extends BoxPainter {
  final MaterialDesignIndicator decoration;

  _MaterialDesignPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = Offset(
          offset.dx,
          configuration.size!.height - decoration.indicatorHeight,
        ) &
        Size(configuration.size!.width, decoration.indicatorHeight);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
