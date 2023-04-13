import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/home.dart';

// class todoCard extends StatelessWidget {
//   const todoCard({required this.icon, required this.title, super.key});

//   final Icon icon;
//   final Text title;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topCenter,
//       width: 240,
//       height: 240,
//       decoration: BoxDecoration(
//         color: todoLightGreen,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(color: todoWhite)),
//                   child: Icon(
//                     icon.icon,
//                     color: todoWhite,
//                     size: 30,
//                   ),
//                 ),
//                 Expanded(
//                   child: IconButton(
//                     alignment: Alignment.centerRight,
//                     style: ButtonStyle(
//                       overlayColor: MaterialStateProperty.all(Colors.green),
//                       backgroundColor: MaterialStateProperty.all(Colors.black),
//                     ),
//                     icon: const Icon(
//                       Icons.more_vert,
//                       color: todoWhite,
//                     ),
//                     onPressed: () {},
//                     padding: EdgeInsets.zero,
//                   ),
//                   flex: 1,
//                 )
//               ],
//             ),
//             Expanded(
//               child: SizedBox(),
//             ),
//             Padding(
//               padding: const EdgeInsetsDirectional.only(bottom: 4.0),
//               child: Text('Game',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(color: todoWhite, fontSize: 24)),
//             ),
//             Text(
//               '3 item',
//               textAlign: TextAlign.left,
//               style: TextStyle(color: todoWhite.withAlpha(125)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget todoCard({
  required Icon icon,
  required Text title,
}) {
  return Container(
    alignment: Alignment.topCenter,
    width: 240,
    height: 240,
    decoration: BoxDecoration(
      color: todoLightGreen,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: todoWhite)),
                child: Icon(
                  icon.icon,
                  color: todoWhite,
                  size: 30,
                ),
              ),
              TextButton.icon(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.more_vert,
                    color: todoWhite,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(todoWhite)),
                  label: const SizedBox())
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(bottom: 4.0),
            child: Text('Game',
                textAlign: TextAlign.left,
                style: TextStyle(color: todoWhite, fontSize: 20)),
          ),
          Text(
            '3 item',
            textAlign: TextAlign.left,
            style: TextStyle(color: todoWhite.withAlpha(125)),
          ),
          Row(
            children: const [
              Expanded(child: SizedBox()),
              Text(
                '50 %',
                textAlign: TextAlign.right,
                style: TextStyle(color: todoWhite),
              ),
            ],
          ),
          const LinearProgressIndicator(
            backgroundColor: todoWhite,
            minHeight: 6,
            value: 0.5,
          )
        ],
      ),
    ),
  );
}

Widget buildDrawer({required BuildContext context, required dynamic widget}) {
  return Drawer(
    backgroundColor: Colors.transparent,
    width: MediaQuery.of(context).size.width / 1.4,
    child: Material(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              widget.userPass.email!.isNotEmpty
                                  ? widget.userPass.email!.substring(
                                      0,
                                      widget.userPass.email!.lastIndexOf('@'),
                                    )
                                  : widget.userPass.email!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              widget.userPass.password!,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildListTitle(
                icon: const Icon(Icons.abc), text: 'text', ontap: () {}),
            buildListTitle(
                icon: const Icon(Icons.abc), text: 'text', ontap: () {}),
            buildListTitle(
                icon: const Icon(Icons.abc), text: 'text', ontap: () {}),
            buildListTitle(
                icon: const Icon(Icons.abc), text: 'text', ontap: () {}),
            buildListTitle(
                icon: const Icon(Icons.abc), text: 'text', ontap: () {}),
            const Divider(
              color: Colors.white38,
            ),
            buildListTitle(
                icon: const Icon(Icons.abc), text: 'text', ontap: () {}),
          ],
        ),
      ),
    ),
  );
}
