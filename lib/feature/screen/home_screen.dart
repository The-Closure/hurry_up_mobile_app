import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riide/core/resources/color.dart';
import 'package:riide/feature/history/history_screen.dart';
import 'package:riide/feature/orders/create_order/order_screen.dart';
import 'package:riide/feature/orders/pending_order/pending_order_screen.dart';
import 'package:riide/feature/path/short_path_screen.dart';
import 'package:riide/feature/screen/cubit/get_vertex_cubit.dart';

// class HomeScreen2 extends StatelessWidget {
//   const HomeScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetVertexCubit()..getVertex(),
//       child: Scaffold(
//         body: BlocBuilder<GetVertexCubit, GetVertexState>(
//           builder: (context, state) {
//             return Center(
//               child: Column(
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         final vertex =
//                             BlocProvider.of<GetVertexCubit>(context).vertex;
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ShortPathScreen(vertex: vertex),
//                             ));
//                       },
//                       child: Text('Short Path')),
//                   TextButton(
//                       onPressed: () {
//                         final vertex =
//                             BlocProvider.of<GetVertexCubit>(context).vertex;
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => OrderScreen(vertex: vertex),
//                             ));
//                       },
//                       child: Text('Order ')),
//                   TextButton(
//                       onPressed: () {
//                         final vertex =
//                             BlocProvider.of<GetVertexCubit>(context).vertex;
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   HistoryScreen(vertex: vertex),
//                             ));
//                       },
//                       child: Text('history ')),
//                   TextButton(
//                       onPressed: () {
//                         final vertex =
//                             BlocProvider.of<GetVertexCubit>(context).vertex;
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   PendingOrderScreen(vertex: vertex),
//                             ));
//                       },
//                       child: Text('pending ')),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => GetVertexCubit()..getVertex(),
      child: BlocBuilder<GetVertexCubit, GetVertexState>(
        builder: (context, state) {
          final vertex = BlocProvider.of<GetVertexCubit>(context).vertex;
          return OrderScreen(vertex: vertex);
        },
      ),
    ),
    BlocProvider(
      create: (context) => GetVertexCubit()..getVertex(),
      child: BlocBuilder<GetVertexCubit, GetVertexState>(
        builder: (context, state) {
          final vertex = BlocProvider.of<GetVertexCubit>(context).vertex;
          return ShortPathScreen(vertex: vertex);
        },
      ),
    ),
    BlocProvider(
      create: (context) => GetVertexCubit()..getVertex(),
      child: BlocBuilder<GetVertexCubit, GetVertexState>(
        builder: (context, state) {
          final vertex = BlocProvider.of<GetVertexCubit>(context).vertex;
          return PendingOrderScreen(vertex: vertex);
        },
      ),
    ),
    BlocProvider(
      create: (context) => GetVertexCubit()..getVertex(),
      child: BlocBuilder<GetVertexCubit, GetVertexState>(
        builder: (context, state) {
          final vertex = BlocProvider.of<GetVertexCubit>(context).vertex;
          return HistoryScreen(vertex: vertex);
        },
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF0E0E0E),
            icon: Icon(Icons.add_circle_outline),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF0E0E0E),
            icon: Icon(Icons.map_outlined),
            label: 'Shortest Path',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF0E0E0E),
            icon: Icon(Icons.car_crash_rounded),
            label: 'Join Order',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF0E0E0E),
            icon: Icon(Icons.location_history_outlined),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MainColor().appGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
