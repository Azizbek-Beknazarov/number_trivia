import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/number_trivia_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';
import '../widgets/trivia_display.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<TriviaRaqamBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TriviaRaqamBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<TriviaRaqamBloc, TriviaRaqamState>(
                builder: (context, state) {
                  if (state is Bush) {
                    return MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is Yuklanyapti) {
                    return LoadingWidget();
                  } else if (state is Yuklandi) {
                    return TriviaDisplay(numberTrivia: state.triviaRaqami);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.error,
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }
}
