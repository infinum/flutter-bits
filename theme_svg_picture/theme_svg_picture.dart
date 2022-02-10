import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/svg.dart';

/// Used like SvgPicture.asset but this will actually load svg file as string.
/// It will then adjust all hex colors in SVG file to fit theme colors.
///
/// Implementing [height] and [width] should avoid layout jumps until image is loaded.
///
/// Cache should work. `loadString` will cache and `SvgPicture.string` also has it's own cache.
class ThemeSvgPicture extends StatefulWidget {
  const ThemeSvgPicture({Key? key, required this.asset, this.height, this.width}) : super(key: key);

  final double? height;
  final double? width;
  final String asset;

  @override
  _ThemeSvgState createState() => _ThemeSvgState();
}

class _ThemeSvgState extends State<ThemeSvgPicture> {
  String? _svgContent;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSvgAndAdjustColors().then((String value) {
      if (mounted) {
        setState(() {
          _svgContent = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: (_svgContent == null) ? null : SvgPicture.string(_svgContent!));
  }

  Future<String> _loadSvgAndAdjustColors() async {
    // Here specify colors of your theme in hex string
    final String primaryColorHex = _parseColorToHexString(Theme.of(context).primaryColor);
    final String accentColorHex = _parseColorToHexString(Theme.of(context).accentColor);

    // colorPrimaryInSvg and colorAccentInSvg are colors that are going to be transformed
    final String stringSvg = await rootBundle.loadString(widget.asset);
    final String replaced = stringSvg
        .replaceAll('#${colorPrimaryInSvg}', '#$primaryColorHex')
        .replaceAll('#${colorAccentInSvg}', '#$accentColorHex');

    return replaced;
  }

  /// Parses format e.g. Color(0xff77665A) to 77665A
  String _parseColorToHexString(Color color) {
    final int length = color.toString().length;
    return color.toString().substring(length - 7, length - 1);
  }
}
