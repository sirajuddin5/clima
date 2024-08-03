// import 'package:flutter/material.dart';
//
//
// class SearchBarDemo extends StatefulWidget {
//   final ValueChanged<String>? onSearchTextChanged;
//
//   const SearchBarDemo({Key? key, this.onSearchTextChanged}) : super(key: key);
//
//   @override
//   _SearchBarDemoState createState() => _SearchBarDemoState();
// }
//
// class _SearchBarDemoState extends State<SearchBarDemo> {
//   bool _folded = true;
//   late TextEditingController _searchController;
//
//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void _onSearchTextChanged(String text) {
//     setState(() {
//       _searchController.text = text;
//       widget.onSearchTextChanged?.call(text); // Callback to parent widget
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         AnimatedContainer(
//           duration: Duration(milliseconds: 400),
//           width: _folded ? 56 : 300,
//           height: 56,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(_folded ? 32 : 35),
//             color: Colors.grey[200],
//             boxShadow: _folded
//                 ? null
//                 : [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.only(left: 16),
//                   child: !_folded
//                       ? TextField(
//                     controller: _searchController,
//                     onChanged: _onSearchTextChanged,
//                     decoration: InputDecoration(
//                       hintText: 'Search...',
//                       hintStyle: TextStyle(color: Colors.blue[300]),
//                       border: InputBorder.none,
//
//                     ),
//                   )
//                       : null,
//                 ),
//               ),
//               AnimatedContainer(
//                 duration: Duration(milliseconds: 400),
//                 child: Material(
//                   type: MaterialType.transparency,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(_folded ? 32 : 20),
//                     topRight: Radius.circular(20),
//                     bottomLeft: Radius.circular(_folded ? 32 : 20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(20),
//                     onTap: () {
//                       setState(() {
//                         _folded = !_folded;
//                         if (_folded) {
//                           // Clear search text when folding
//                           _onSearchTextChanged('');
//                         }
//                       });
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Icon(
//                         _folded ? Icons.search : Icons.close,
//                         color: Colors.blue[900],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//

import 'package:flutter/material.dart';

class SearchBarDemo extends StatefulWidget {
  final ValueChanged<String>? onSearchTextChanged;

  const SearchBarDemo({Key? key, this.onSearchTextChanged}) : super(key: key);

  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  bool _folded = true;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      _searchController.text = text;
      widget.onSearchTextChanged?.call(text); // Callback to parent widget
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: _folded ? 40 : 300,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_folded ? 32 : 35),
            color: Colors.grey[200],
            boxShadow: _folded ? null : [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)],
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                   
                    child: !_folded
                        ? TextField(
                      controller: _searchController,
                      onChanged: _onSearchTextChanged,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: Colors.blue[300]),
                        border: InputBorder.none,
                      ),
                    )
                        : null,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: Material(
                  type: MaterialType.transparency,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_folded ? 32 : 5),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(_folded ? 32 : 5),
                    bottomRight: Radius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      setState(() {
                        _folded = !_folded;
                        if (_folded) _onSearchTextChanged('');
                      });
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(_folded ? Icons.location_city : Icons.close, color: Colors.yellow[900]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
