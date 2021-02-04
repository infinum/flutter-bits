# look

Look is a package for styling the app theme. It is basically expansion of flutter Theme that allows
us to use colors and typography in a consistent manner throught the app.

Without Look, some colors would be in theme like `Theme.of(color).primary`, but not all colors could
fit flutter limited theme color scheme, so some of them you would reference as
`MyColors.greyishBlue`.

Beside incosistency, those colors also couldn't update on theme change.


#### Introducing Look

With Look, you'll reference both colors like `Look.of(context).color.primary` or
`Look.of(context).color.greyishBlue`. The Look colors will have to define material color scheme so
we can map it to flutter ThemeData, so under the hood we will still use ThemeData because Flutter
use it as default styling when coloring components.

The workflow is also defined with designer, which makes it easy to work.
The designer will export all colors in one page, which will be implemented into LookData constructor.
This also means, when developing you are not interested in HEX number, but rather color name so you
can write `Look.of(context).color.colorName`;


#### Usage

Copy everything from /ui/common/look to you project. You'll have to redefine all look data for your
project with the data from design page (figma, sketch...).

```dart

return Look(
      lookData: LookData.default(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Look Demo',
          theme: ThemeDataMapper.map(Look.of(context)), // Here we map LookData theme to ThemeData
          home: HomeScreen(),
        );
      }),
    );

```

This project contains one provider and `LookSubtree`. This is example of how to do theme change
at runtime. If you don't need need, you can delete that.



