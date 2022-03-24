import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ViewStateRefreshListProvider<T> extends GetxController {
  RxList<T> list = <T>[].obs;

  final _isEmpty = false.obs;

  bool get isEmpty => _isEmpty.value;

  set isEmpty(val) => _isEmpty.value = val;

  final _loading = false.obs;

  bool get loading => _loading.value;

  set loading(val) => _loading.value = val;

  int _page = 1;

  int pageSize = 10;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  ViewStateRefreshListProvider();

  Future<List<T>> pullRefresh() async {
    _page = 1;
    _isEmpty.value = false;
    try {
      var data = await loadData(_page);
      if (data.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        list.clear();
        _isEmpty.value = true;
      } else {
        list.clear();
        list.assignAll(data);
        refreshController.refreshCompleted();
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      }
      return data;
    } catch (e) {
      refreshController.refreshFailed();
      throw Exception('刷新失败');
    }
  }

  Future<List<T>> loadMore() async {
    try {
      var data = await loadData(++_page);
      if (data.isEmpty) {
        _page--;
        refreshController.loadNoData();
      } else {
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      }
      return data;
    } catch (e) {
      _page--;
      refreshController.loadFailed();
      throw Exception('上拉加载失败');
    }
  }

  Future<List<T>> init() async {
    _loading.value = true;
    try {
      var data = await loadData(_page);
      if (data.isEmpty) {
        refreshController.loadNoData();
        list.clear();
        _isEmpty.value = true;
      } else {
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      }
      return data;
    } catch (e, s) {
      refreshController.loadFailed();
      throw Exception('上拉加载失败');
    } finally {
      _loading.value = false;
    }
  }

  // 加载数据
  Future<List<T>> loadData(int page);

  @override
  void onClose() {
    _refreshController.dispose();
    super.onClose();
  }
}
