import 'package:flutter/material.dart';

mixin ScrollManagerMixin {

  ScrollController scrollController = ScrollController();
  double get _scrollThreshold => .8;

  void onScrollNearBottom();
  void initScrollListener() {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (currentScroll <= (maxScroll * _scrollThreshold)) {
      onScrollNearBottom();
    }
  }

  void disposeScrollListener() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
  }
}
