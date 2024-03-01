import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';

TextDirection detectRtlDirectionality(String text) {
  if (intl.Bidi.detectRtlDirectionality(text)) {
    return TextDirection.rtl;
  }
  return TextDirection.ltr;
}
