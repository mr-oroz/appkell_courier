import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderButtons extends HookConsumerWidget {
  const OrderButtons({
    super.key,
    this.onAccept,
    this.onReject,
  });

  final Future Function()? onAccept;
  final Future Function()? onReject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingAccept = useState(false);
    final isLoadingReject = useState(false);
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (isLoadingAccept.value) return;
            isLoadingAccept.value = true;
            await onAccept?.call();
            isLoadingAccept.value = false;
          },
          child: Container(
            height: 45,
            decoration: ShapeDecoration(
              color: const Color(0xFFFF6C29),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            alignment: Alignment.center,
            child: !isLoadingAccept.value
                ? const Text(
                    'Принять',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      //
                      fontWeight: FontWeight.w700,
                      // height: 0,
                    ),
                  )
                : const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  ),
          ),
        ),
        const Gap(10),
        GestureDetector(
          onTap: () async {
            if (isLoadingReject.value) return;
            isLoadingReject.value = true;
            await onReject?.call();
            isLoadingReject.value = false;
          },
          child: Container(
            height: 45,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFFF6C29)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            alignment: Alignment.center,
            child: !isLoadingReject.value
                ? const Text(
                    'Отклонить',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF6C29),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  )
                : const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator.adaptive(),
                  ),
          ),
        ),
      ],
    );
  }
}
