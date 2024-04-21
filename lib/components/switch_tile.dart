import 'package:flutter/material.dart';

class SwtichTile extends StatelessWidget {
	final Widget leading;
	final Widget title;
	final bool value;
	final Function(bool?) onChanged;

	const SwtichTile({
		super.key,
		required this.leading,
		required this.title,
		required this.value,
		required this.onChanged,
	});

	@override
	Widget build(BuildContext context) {
		return ListTile(
			title: title,
			leading: leading,
			trailing: Transform.scale(
				scale: 0.9,
				child: IgnorePointer(
					child: Switch(value: value, onChanged: onChanged),
				),
			),
			onTap: () => onChanged(!value),
		);
	}
}
