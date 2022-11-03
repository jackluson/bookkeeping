import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/commons/commons.dart';
import '/accounts/accounts.dart';

class DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return
      buildFormItem(
        '描述',
        BlocSelector<AccountAdjustBalanceBloc, AccountAdjustBalanceState, String?>(
          selector: (state) => state.request.description,
          builder: (context, state) {
            controller.value = TextEditingValue(
              text: state ?? '',
              selection: TextSelection.fromPosition(
                TextPosition(offset: state?.length ?? 0),
              ),
            );
            return
              TextField(
                controller: controller,
                onChanged: (value) => context.read<AccountAdjustBalanceBloc>().add(AccountAdjustBalanceDescriptionChanged(value)),
                decoration: InputDecoration()
              );
          }
        ), context
      );
  }
}