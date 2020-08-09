// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_line_date_picker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomLineDatePickerController
    on _CustomLineDatePickerControllerBase, Store {
  final _$valueAtom = Atom(name: '_CustomLineDatePickerControllerBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CustomLineDatePickerControllerBaseActionController =
      ActionController(name: '_CustomLineDatePickerControllerBase');

  @override
  void setValue(dynamic val) {
    final _$actionInfo = _$_CustomLineDatePickerControllerBaseActionController
        .startAction(name: '_CustomLineDatePickerControllerBase.setValue');
    try {
      return super.setValue(val);
    } finally {
      _$_CustomLineDatePickerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
