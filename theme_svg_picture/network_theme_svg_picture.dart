import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cyklaer/ui/common/bits/look/widget/look.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/svg.dart';

const _colorSecondary = '6A77E5';
const _colorSecondaryVariant = '3D4ABA';
const _colorHightLight = '74FFE8';

/// Like SvgPicture.network but this will actually load svg file as string.
/// It will then adjust all colors to fit theme primary and accent colors.
class ThemeSvgPicture extends StatefulWidget {
  const ThemeSvgPicture({Key? key, required this.imageUrl, required this.fit}) : super(key: key);

  final String imageUrl;
  final BoxFit fit;

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
    final state = _svgContent == null ? CrossFadeState.showFirst : CrossFadeState.showSecond;
    final secondChild = _svgContent == null ? const SizedBox() : SvgPicture.string(_svgContent!, fit: widget.fit);
    return AnimatedCrossFade(
      firstChild: const SizedBox(),
      secondChild: SizedBox(width: double.infinity, height: double.infinity, child: secondChild),
      crossFadeState: state,
      duration: kThemeAnimationDuration,
    );
  }

  Future<String> _loadSvgAndAdjustColors() async {
    final String secondaryColorHex = _parseColorToHexString(Look.of(context).color.secondary);
    final String secondaryVariantColorHex = _parseColorToHexString(Look.of(context).color.secondaryVariant);
    final String hightlightColorHex = _parseColorToHexString(Look.of(context).color.highlight);

    final Uint8List bytes = await httpGet(widget.imageUrl);
    final String stringSvg = utf8.decode(bytes);

    final String replaced = stringSvg
        .replaceAll('#$_colorSecondary', '#$secondaryColorHex')
        .replaceAll('#$_colorSecondaryVariant', '#$secondaryVariantColorHex')
        .replaceAll('#$_colorHightLight', '#$hightlightColorHex');

    return replaced;
  }

  /// Parses Color(0xff77665A) to 77665A
  String _parseColorToHexString(Color color) {
    final int length = color.toString().length;
    return color.toString().substring(length - 7, length - 1);
  }
}

/// Copied from flutter_svg package. Their method to fetch an image.
/// Didn't make sense to move from here to dio layer as this is internal to image provider.
///
/// Fetches an HTTP resource from the specified [url] using the specified [headers].
Future<Uint8List> httpGet(String url, {Map<String, String>? headers}) async {
  final HttpClient httpClient = HttpClient();
  final Uri uri = Uri.base.resolve(url);
  final HttpClientRequest request = await httpClient.getUrl(uri);
  if (headers != null) {
    headers.forEach((String key, String value) {
      request.headers.add(key, value);
    });
  }
  final HttpClientResponse response = await request.close();

  if (response.statusCode != HttpStatus.ok) {
    throw HttpException('Could not get network asset', uri: uri);
  }

  return consolidateHttpClientResponseBytes(response);
}
