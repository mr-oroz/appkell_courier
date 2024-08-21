import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../widgets/loading_icon.dart';

class EmptyOrderListContainer extends StatelessWidget {
  const EmptyOrderListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingIcon(),
          Gap(25),
          Text(
            'Здесь будут появляться запросы от клиентов',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFADADAD),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
