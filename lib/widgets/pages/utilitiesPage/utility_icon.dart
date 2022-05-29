import 'package:flutter/material.dart';

class UtilityIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final Function? onPressed;
  final Color color;

  const UtilityIcon(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  State<UtilityIcon> createState() => _UtilityIconState();
}

class _UtilityIconState extends State<UtilityIcon>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double _defaultScale = 1.0;
  final double _minScale = 0.90;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
      value: _defaultScale,
    )..stop(canceled: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _playAnimation(),
      onTap: (() {
        widget.onPressed!();
      }),
      onLongPress: () => widget.onPressed,
      child: Container(
        width: 120,
        height: 140,
        padding: const EdgeInsets.all(16.0),
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: widget.color.withAlpha(20),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    widget.icon,
                    color: widget.color,
                    size: 50.0,
                  ),
                ),
              ),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.button!.color,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playAnimation() {
    _controller
        .animateTo(_minScale)
        .then((value) => _controller.animateTo(_defaultScale));
  }
}
