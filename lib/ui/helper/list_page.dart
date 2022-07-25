import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/pull_to_refresh_impl.dart';
import '../widgets/widgets.dart';

class ListPage extends StatefulWidget {
  final ViewStateRefreshListProvider controller;
  final IndexedWidgetBuilder itemBuilder;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final int? itemCount;

  const ListPage({
    Key? key,
    required this.controller,
    required this.itemBuilder,
    this.appBar,
    this.backgroundColor,
    this.itemCount,
  }) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? const Color(0xffF9F8FD),
      appBar: widget.appBar,
      body: Obx(() {
        Widget _child;
        final controller = widget.controller;
        if (controller.loading) {
          _child = const LoadingWidget();
        } else if (controller.isEmpty) {
          _child = const EmptyWidget();
        } else {
          _child = ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.itemCount ?? controller.list.length,
            itemBuilder: widget.itemBuilder,
          );
        }
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.pullRefresh,
          onLoading: controller.loadMore,
          enablePullUp: true,
          child: _child,
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
