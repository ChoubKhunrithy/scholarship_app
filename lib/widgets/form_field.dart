import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scholarship_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double fieldHeight = 40;
const double labelFontSize = 15;
const double asteriskFontSize = 12;
const double hintFontSize = 14;
const double textFontSize = 14; // input n dropdown item
const double errorFontSize = 10;

// Field Label Widget
class FieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const FieldLabel({super.key, required this.label, this.isRequired = true});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: AppColors.textDark,
          fontSize: labelFontSize,
          fontWeight: FontWeight.normal,
        ),
        children: isRequired
            ? const [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: asteriskFontSize,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}

// Validated Dropdown
class ValidatedDropdown<T> extends StatelessWidget {
  final T? value;
  final String hintText;
  final TextStyle? hintStyle;
  final List<T> items;
  final void Function(T?) onChanged;
  final String? errorText;
  final String Function(T)? itemLabel;

  const ValidatedDropdown({
    super.key,
    required this.value,
    required this.hintText,
    this.hintStyle,
    required this.items,
    required this.onChanged,
    this.errorText,
    this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: fieldHeight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(12),
              border: hasError
                  ? Border.all(color: AppColors.red, width: 1)
                  : null,
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<T>(
                  value: value,
                  hint: Text(
                    hintText,
                    style:
                        hintStyle ??
                        const TextStyle(
                          color: AppColors.hintText,
                          fontSize: hintFontSize,
                        ),
                  ),
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: textFontSize,
                  ),
                  isExpanded: true,
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.grey,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    offset: const Offset(0, -5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(
                    height: fieldHeight,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  ),
                  items: items.map((item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                        child: Text(
                          itemLabel != null
                              ? itemLabel!(item)
                              : item.toString(),
                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontSize: textFontSize,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  selectedItemBuilder: (BuildContext context) {
                    return items.map((item) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          itemLabel != null
                              ? itemLabel!(item)
                              : item.toString(),
                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontSize: textFontSize,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: AppColors.red,
                fontSize: errorFontSize,
              ),
            ),
          ),
      ],
    );
  }
}

/// Validated Date Picker Field
class ValidatedDatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onTap;
  final String hintText;
  final String? errorText;

  const ValidatedDatePickerField({
    super.key,
    required this.selectedDate,
    required this.onTap,
    this.hintText = 'dd/mm/yyyy',
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: fieldHeight,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12),
                border: hasError
                    ? Border.all(color: AppColors.red, width: 1)
                    : null,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == null
                            ? hintText
                            : '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}',
                        style: TextStyle(
                          color: selectedDate == null
                              ? AppColors.hintText
                              : AppColors.textDark,
                          fontSize: hintFontSize,
                        ),
                      ),
                      const Icon(Icons.date_range_outlined, color: AppColors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: AppColors.red,
                fontSize: errorFontSize,
              ),
            ),
          ),
      ],
    );
  }
}

// Validated Image Picker Button
class ValidatedImagePickerButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool hasImage;
  final String? errorText;

  const ValidatedImagePickerButton({
    super.key,
    required this.onTap,
    required this.text,
    this.hasImage = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: fieldHeight,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12),
                border: hasError
                    ? Border.all(color: AppColors.red, width: 1)
                    : null,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: hintFontSize,
                          color: AppColors.hintText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: AppColors.red,
                fontSize: errorFontSize,
              ),
            ),
          ),
      ],
    );
  }
}

// Custom Text Input
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.validator,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

// Custom Text Input State
class _CustomTextFieldState extends State<CustomTextField> {
  late String? _internalError;

  @override
  void initState() {
    super.initState();
    _internalError = widget.errorText;
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorText != oldWidget.errorText) {
      setState(() {
        _internalError = widget.errorText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasError = _internalError != null && _internalError!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: fieldHeight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(12),
              border: hasError
                  ? Border.all(color: AppColors.red, width: 1)
                  : null,
            ),
            child: Center(
              child: TextFormField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                maxLines: widget.maxLines,
                style: const TextStyle(
                  fontSize: textFontSize,
                  color: AppColors.textDark,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle:
                      widget.hintStyle ??
                      const TextStyle(
                        color: AppColors.hintText,
                        fontSize: hintFontSize,
                      ),
                  filled: true,
                  fillColor: Colors.transparent,
                  suffixIcon: widget.suffixIcon,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  errorStyle: const TextStyle(
                    height: 0,
                    fontSize: 0, //text field inline error font size (hidden)
                  ),
                ),
                validator: (value) {
                  final error = widget.validator?.call(value);
                  setState(() {
                    _internalError = error;
                  });
                  return null;
                },
              ),
            ),
          ),
        ),
        if (_internalError != null && _internalError!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              _internalError!,
              style: const TextStyle(
                color: AppColors.red,
                fontSize: errorFontSize,
              ),
            ),
          ),
      ],
    );
  }
}

// Custom Dropdown
class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final String hintText;
  final TextStyle? hintStyle;
  final List<T> items;
  final void Function(T?) onChanged;
  final Widget? suffixIcon;
  final String Function(T)? itemLabel;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.hintText,
    this.hintStyle,
    required this.items,
    required this.onChanged,
    this.suffixIcon,
    this.itemLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight,
      child: Center(
        child: DropdownButtonFormField<T>(
          initialValue: value,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                hintStyle ??
                const TextStyle(
                  color: AppColors.hintText,
                  fontSize: hintFontSize,
                ),
            filled: true,
            fillColor: AppColors.inputBackground,
            suffixIcon: suffixIcon,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemLabel != null ? itemLabel!(item) : item.toString(),
                style: const TextStyle(
                  fontSize: textFontSize,
                  color: AppColors.textDark,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// Form Field Container
class FormFieldContainer extends StatelessWidget {
  final Widget child;
  final double bottomPadding;

  const FormFieldContainer({
    super.key,
    required this.child,
    this.bottomPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: child,
    );
  }
}