import 'package:flutter/material.dart';

// ... more imports depending on the project


/// Shows generic error widget, with possibility to add retry button below it
/// if [onRetry] is not null retry will be active
///
/// Should have either [message] or [exception] that will be shown to user as readable message
class GenericError extends StatelessWidget {
  const GenericError({this.message, this.exception, this.onRetry, Key? key})
      : assert(message != null || exception != null, 'You need to provider either message or exception'),
        super(key: key);

  final String? message;
  final Exception? exception;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleIcon(
              backgroundColor: Look.of(context).color.error.withOpacity(0.1),
              child: Icon(
                Icons.error_outline,
                color: Look.of(context).color.error,
              ),
            ),
            const SizedBox(width: 12),
            Text(message ?? ErrorFormatter.format(exception!, context: context),
                textAlign: TextAlign.center, style: Look.of(context).typography.body),
            const SizedBox(height: 16),
            _showRetry(context),
          ],
        ),
      ),
    );
  }

  /// Show retry button below the widget if [onRetry] has been provided
  Widget _showRetry(BuildContext context) {
    if (onRetry == null) {
      return const SizedBox.shrink();
    }
    return BrandButton(
      onPressed: () {
        onRetry?.call();
      },
      child: Text(Strings.of(context).retry.toUpperCase()),
    );
  }
}