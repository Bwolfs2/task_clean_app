import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'custom_line_date_picker_controller.g.dart';

class CustomLineDatePickerController = _CustomLineDatePickerControllerBase
    with _$CustomLineDatePickerController;

abstract class _CustomLineDatePickerControllerBase with Store {
  @observable
  String value = "Selecione a Data";

  @action
  void setValue(val) => value = DateFormat("dd/MM/yyyy hh:mm").format(val);
}
