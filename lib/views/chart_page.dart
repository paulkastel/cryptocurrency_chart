import 'package:cryptochart/cubits/chart/chart_cubit.dart';
import 'package:cryptochart/views/chart_view.dart';
import 'package:cryptochart/views/price_header.dart';
import 'package:cryptochart/views/time_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  Future<void> _onPageChaged(BuildContext context, int index) {
    return context.read<ChartCubit>().getChartFor(ChartPeriod.values[index]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ChartPeriod.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Icon(Icons.currency_bitcoin_outlined),
          bottom: TabBar(
            onTap: (tabIndex) => _onPageChaged(context, tabIndex),
            tabs: const [
              Tab(text: 'Two weeks'),
              Tab(text: '3 days'),
              Tab(text: 'Last hour'),
            ],
          ),
        ),
        body: BlocConsumer<ChartCubit, ChartState>(
          listener: (context, state) {
            if (state is ChartNetworkError) {
              final i = DefaultTabController.of(context)!.index;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  action: SnackBarAction(
                    label: 'Retry',
                    onPressed: () => context.read<ChartCubit>().getChartFor(ChartPeriod.values[i]),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ChartSuccess) {
              return Column(
                children: [
                  TimeHeader(state.data),
                  PriceHeader(state.data.data.last),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ChartView(state.data.data),
                        ChartView(state.data.data),
                        ChartView(state.data.data),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ChartError) {
              return Center(
                child: Text(state.message, textAlign: TextAlign.center),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
