import 'package:catering/Application/Feedback/feedback_cubit.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FeedbackCubit>().submitFeedback();
    });
    return Scaffold(
      appBar: AppBar(title: Text('Feedbacks')),
      body: BlocConsumer<FeedbackCubit, FeedbackState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
            () => null,
            (either) => either.fold((failure) {
              if (!state.isLoading) {
                if (failure == const MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == const MainFailure.authFailure()) {
                  displaySnackBar(
                    context: context,
                    text: "Please check the email address",
                  );
                } else if (failure == const MainFailure.incorrectCredential()) {
                  displaySnackBar(context: context, text: "Incorrect Password");
                } else if (failure == const MainFailure.clientFailure()) {
                  displaySnackBar(
                    context: context,
                    text: "Something wrong with your network",
                  );
                } else {
                  displaySnackBar(
                    context: context,
                    text: "Something Unexpected Happened",
                  );
                }
              }
            }, (r) {}),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return state.isFailureOrSuccess.fold(
            () => const Center(child: Text("No Feedbacks")),
            (either) => either.fold(
              (failure) {
                return const Center(child: Text("No Feedbacks"));
              },
              (feedbacks) {
                return ListView.builder(
                  itemCount: feedbacks.feedbacks!.length,
                  itemBuilder: (context, index) {
                    final feedback = feedbacks.feedbacks![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(feedback.ownername![0].toUpperCase()),
                        ),
                        title: Text(feedback.feedback!),
                        subtitle: Text(
                          'By ${feedback.username} for ${feedback.service}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
