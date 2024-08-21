import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final phoneFormatter = MaskTextInputFormatter(
  mask: '+996 ### ### ###',
  filter: {"#": RegExp(r'[0-9]')},
);

final timerFormatter = MaskTextInputFormatter(
  mask: '##:##-##:##',
  filter: {"#": RegExp(r'[0-9]')},
);


