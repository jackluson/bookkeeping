import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/accounts/accounts.dart';
import '/commons/commons.dart';

class IncludeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      buildFormItem(
        "是否计入净资产",
        BlocSelector<AccountFormBloc, AccountFormState, bool?>(
          selector: (state) => state.request.include,
          builder: (context, state) {
            return
              Align(
                alignment: Alignment.centerLeft,
                child: Switch(
                  value: state ?? true,
                  onChanged: (value) => context.read<AccountFormBloc>().add(AccountFormIncludeChanged(value)),
                ),
              );
          }
        ), context);
  }
}