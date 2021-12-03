void useActionListener(void Function(CompositeSubscription compositeSubscription) listenCallback) {
  return use(_ActionListenerHook(listenCallback));
}

class _ActionListenerHook extends Hook<void> {
  const _ActionListenerHook(this.listenCallback);

  final void Function(CompositeSubscription compositeSubscription) listenCallback;

  @override
  __ActionListenerHookState createState() => __ActionListenerHookState();
}

class __ActionListenerHookState extends HookState<void, _ActionListenerHook> {
  final compositeSubscription = CompositeSubscription();

  @override
  void initHook() {
    super.initHook();
    hook.listenCallback(compositeSubscription);
  }

  @override
  void dispose() {
    compositeSubscription.dispose();
    super.dispose();
  }

  @override
  void build(BuildContext context) {}
}
