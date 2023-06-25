import 'package:flutter/material.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messages_list_widgets/messages_list_widget.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messages_list_widgets/scroll_down_button.dart';
class MessagesList extends StatefulWidget {
  const MessagesList({Key ?key}) : super(key: key);
  @override
  State<MessagesList> createState() => _MessagesListState();
}
class _MessagesListState extends State<MessagesList> with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollButton = false;
  void _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    setState(() {
      _showScrollButton=false;
    });
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
  @override
  void didChangeMetrics() {
    final keyboardVisibleHeight = View.of(context).viewInsets.bottom;
    if (keyboardVisibleHeight > 0) {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent+2);
    }
  }
  void _scrollListener() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollExtent = _scrollController.position.pixels;
    setState(() {
      _showScrollButton = currentScrollExtent < maxScrollExtent-50;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MessagesListWidget(scrollController: _scrollController),
        ScrollDownButton(onTap: _scrollToBottom,isDown:_showScrollButton),
      ],
    );
  }
}