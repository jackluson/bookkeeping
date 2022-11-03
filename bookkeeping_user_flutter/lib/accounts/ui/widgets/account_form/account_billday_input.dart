import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/commons/commons.dart';
import '/accounts/accounts.dart';

class AccountBillDayInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return
      buildFormItem(
        '账单日',
          BlocSelector<AccountFormBloc, AccountFormState, String?>(
            selector: (state) => state.request.billDay,
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
                  onChanged: (value) => context.read<AccountFormBloc>().add(AccountFormBillDayChanged(value)),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                );
              }
          ), context
      );
  }
}
