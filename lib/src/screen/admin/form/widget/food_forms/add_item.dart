import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFoodItemForm extends ConsumerWidget {
  const AddFoodItemForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: FormBuilder(
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'Name',

            )
          ],
        ),
      ),
    );
  }
}
