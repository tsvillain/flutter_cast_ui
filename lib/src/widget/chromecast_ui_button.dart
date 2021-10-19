import 'package:cast_ui/cast_ui.dart';
import 'package:cast_ui/src/util/extensions/context_extensions.dart';
import 'package:cast_ui/src/widget/chromecast_device_dialog.dart';
import 'package:cast_ui/src/widget/provider/provider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChromecastUiButton extends StatefulWidget {
  final String? dialogTitle;
  final Color? iconColor;
  final double? barHeight;
  final double? iconSize;

  const ChromecastUiButton({
    this.dialogTitle,
    this.iconColor,
    this.barHeight,
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  _ChromecastUiButtonState createState() => _ChromecastUiButtonState();
}

class _ChromecastUiButtonState extends State<ChromecastUiButton>
    implements ChromecastUiButtonNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ChromecastUiButtonViewModel>(
      create: () => ChromecastUiButtonViewModel()..init(this),
      consumer: (context, viewModel, child) => GestureDetector(
        onTap: viewModel.onClick,
        child: Container(
          height: widget.barHeight,
          color: Colors.transparent,
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Icon(
            viewModel.hasActiveSession
                ? Icons.cast_connected_rounded
                : Icons.cast_rounded,
            color: widget.iconColor,
            size: widget.iconSize ?? 16,
            key: ValueKey(viewModel.hasActiveSession),
          ),
        ),
      ),
    );
  }

  @override
  Future<void> showChromecastDeviceDialog() async {
    final dialog = ChromecastDeviceDialog(
      title: widget.dialogTitle,
    );
    if (context.isIOSTheme) {
      return showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true,
        builder: (context) => dialog,
      );
    }
    return showDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (context) => dialog,
    );
  }
}
