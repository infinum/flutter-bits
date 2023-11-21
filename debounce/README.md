# Debounce

## Input error text debounce

Debouncing input error text means delaying the display of error text in cases where the component is in an error state, and the user is currently interacting with it. The component might lose the error state very soon, so we want to wait with displaying the error text until the user finishes their interaction.

For example, show error text if the user-entered email is invalid. While the user is typing, the email is invalid, but we don't want to show the error text just yet, as the user has not finished their interaction. We want to display the error text once the user finishes typing.

While there are multiple ways to handle debounce, the following approach has a few advantages:

* If a component is in an error state at its creation, the error text is  immediately shown.
* When a component loses the error state, the error text immediately disappears.
* When a component is in an error state, and the error text changes, the new error text is immediately shown.
* Only the display of error text is debounced. Other parts of the app have up-to-date information on the component state.

```dart
class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isEmailValid = RegExp(r'^.+@.+\..+$').hasMatch(_emailController.text);
    final emailErrorText = isEmailValid ? null : 'invalid email';

    return Column(
      children: [
        InputErrorTextDebouncer(
          errorText: emailErrorText,
          builder: (context, errorText, debounce) {
            return TextField(
              controller: _emailController,
              decoration: InputDecoration(
                errorText: errorText,
              ),
              onChanged: (_) {
                debounce();
                setState(() {});
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: isEmailValid ? () => Navigator.of(context).push(...) : null,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
```