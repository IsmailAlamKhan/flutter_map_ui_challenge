import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AsyncValueWidgetBuilder<T> = Widget Function(BuildContext, T);
typedef AsyncValueErrorBuilder = Widget Function(BuildContext, dynamic, StackTrace?);

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    super.key,
    required this.value,
    required this.builder,
    this.builderLoading = _defaultLoadingBuilder,
    this.builderError = _defaultErrorBuilder,
  });
  final AsyncValue<T> value;
  final AsyncValueWidgetBuilder<T> builder;
  final WidgetBuilder builderLoading;
  final AsyncValueErrorBuilder builderError;

  factory AsyncValueBuilder.sliver({
    required AsyncValue<T> value,
    required AsyncValueWidgetBuilder<T> builder,
    WidgetBuilder? builderLoading,
    AsyncValueErrorBuilder? builderError,
  }) {
    WidgetBuilder loadingBuilder = builderLoading ??
        (context) => SliverFillRemaining(
              child: _defaultLoadingBuilder(context),
            );

    AsyncValueErrorBuilder errorBuilder = builderError ??
        (context, error, stackTrace) => SliverFillRemaining(
              child: _defaultErrorBuilder(context, error, stackTrace),
            );

    return AsyncValueBuilder<T>(
      value: value,
      builder: builder,
      builderLoading: loadingBuilder,
      builderError: errorBuilder,
    );
  }

  static Widget _defaultLoadingBuilder(BuildContext context) =>
      const Center(child: CircularProgressIndicator());

  static Widget _defaultErrorBuilder(BuildContext context, dynamic error, StackTrace? stackTrace) {
    debugPrintStack(stackTrace: stackTrace);
    return Center(child: Text(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => builderLoading(context),
      error: (error, stackTrace) => builderError(context, error, stackTrace),
      data: (data) => builder(context, data),
    );
  }
}
