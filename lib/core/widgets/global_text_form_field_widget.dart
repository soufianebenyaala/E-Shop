import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalTextFormFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isRequired;
  final bool? isReadOnly;
  final double? topPadding;
  final bool? isDisabled;
  final AutovalidateMode? autovalidateMode;
  final double? desiredWidth;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool? obscureText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final void Function(String)? onFieldSubmitted;
  const GlobalTextFormFieldWidget({
    super.key,
    this.keyboardType,
    this.labelText,
    this.obscureText,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.errorText,
    this.hintText,
    this.inputFormatters,
    this.controller,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.isRequired,
    this.isReadOnly,
    this.topPadding,
    this.autovalidateMode,
    this.isDisabled,
    this.desiredWidth,
    this.focusNode,
    this.onChanged,
    this.border,
    this.validator,
    this.onFieldSubmitted,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.maxLength,
    this.maxLengthEnforcement,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      focusNode: focusNode,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      controller: controller,
      keyboardType: keyboardType,
      selectionControls: MaterialTextSelectionControls(),
      enableInteractiveSelection: isDisabled == true ? false : true,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        errorText: errorText,
        enabled: isDisabled == true ? false : true,
        hintText: hintText,
        labelText: labelText,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        disabledBorder: disabledBorder,
        fillColor: fillColor ??
            (isDisabled == true
                ? Theme.of(context).colorScheme.scrim.withOpacity(0.05)
                : null),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      readOnly: isReadOnly == true ? true : false,
      validator: validator,
    );
  }
}
