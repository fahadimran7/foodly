import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../enums/basic_dialog_status.dart';
import '../styles.dart';
import '../ui_helpers.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _BasicDialogContent(request: request, completer: completer));
  }
}

class _BasicDialogContent extends StatelessWidget {
  const _BasicDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse dialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidthPercentage(context, percentage: 0.04),
          ),
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              Text(
                request.title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              verticalSpaceSmall,
              Text(
                request.description ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(color: kcMediumGreyColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (request.secondaryButtonTitle != null)
                    TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: false)),
                      child: Text(
                        request.secondaryButtonTitle!,
                        style: const TextStyle(
                          color: Color.fromARGB(221, 43, 43, 43),
                        ),
                      ),
                    ),
                  TextButton(
                    onPressed: () => completer(DialogResponse(confirmed: true)),
                    child: Text(
                      request.mainButtonTitle ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: -28,
            child: CircleAvatar(
              minRadius: 16,
              maxRadius: 28,
              backgroundColor: _avatarIconColorByStatus(request.customData),
              child: Icon(
                _avatarIconDataByStatus(request.customData),
                size: 28,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

Color _avatarIconColorByStatus(dynamic regionDialogStatus) {
  if (regionDialogStatus is BasicDialogStatus) {
    switch (regionDialogStatus) {
      case BasicDialogStatus.error:
        return kcRedColor;
      case BasicDialogStatus.warning:
        return kcOrangeColor;
      default:
        return kcPrimaryColor;
    }
  } else {
    return kcPrimaryColor;
  }
}

IconData _avatarIconDataByStatus(dynamic regionDialogStatus) {
  if (regionDialogStatus is BasicDialogStatus) {
    switch (regionDialogStatus) {
      case BasicDialogStatus.error:
        return Icons.close;
      case BasicDialogStatus.warning:
        return Icons.warning_amber;
      default:
        return Icons.check;
    }
  } else {
    return Icons.check;
  }
}
