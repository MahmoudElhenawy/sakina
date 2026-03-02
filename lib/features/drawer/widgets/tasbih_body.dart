import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/features/drawer/controller/tasbih_cubit.dart';
import 'package:sakina/features/drawer/widgets/change_zekr_button.dart';
import 'package:sakina/features/drawer/widgets/main_counter.dart';
import 'package:sakina/features/drawer/widgets/reward_card.dart';
import 'package:sakina/features/drawer/widgets/selected_zekr.dart';
import 'package:sakina/features/drawer/widgets/stats_cards.dart';

class TasbihBody extends StatelessWidget {
  const TasbihBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbihCubit, TasbihState>(
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatsCards(state: state),
                const SizedBox(height: 30),
                SelectedZekr(state: state),
                const SizedBox(height: 30),
                MainCounter(state: state),
                const SizedBox(height: 30),
                const ChangeZekrButton(),
                const SizedBox(height: 20),
                if (state.selectedZekr?.reward != null)
                  RewardCard(reward: state.selectedZekr!.reward!),
              ],
            ),
          ),
        );
      },
    );
  }
}
