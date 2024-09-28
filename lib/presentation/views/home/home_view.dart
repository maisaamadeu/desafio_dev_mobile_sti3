import 'package:desafio_dev_mobile_sti3/presentation/views/charts/charts_view.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/orders/orders_view.dart';
import 'package:desafio_dev_mobile_sti3/presentation/views/reports/reports_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STi3 PEDIDOS'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                'Pedidos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Relatórios',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Gráficos',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _pageController.jumpToPage(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {},
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          OrdersView(),
          ReportsView(),
          ChartsView(),
        ],
      ),
    );
  }
}
