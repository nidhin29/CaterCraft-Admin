import 'package:catering/Application/booking/booking_cubit.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookingCubit>().getBookings();
    });
    return Scaffold(
      appBar: AppBar(title: Text('Bookings')),
      body: BlocConsumer<BookingCubit, BookingState>(
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
            () => const Center(child: Text("No Bookings")),
            (either) => either.fold(
              (failure) {
                return const Center(child: Text("No Bookings"));
              },
              (bookings) {
                return ListView.builder(
                  itemCount: bookings.bookings!.length,
                  itemBuilder: (context, index) {
                    final booking = bookings.bookings![index];
                    final formattedDate = DateFormat(
                      'MMM dd, yyyy – hh:mm a',
                    ).format(DateTime.parse(booking.datetime!));
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.serviceItem!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Customer: ${booking.customerName}'),
                            Text('Email: ${booking.customerEmail}'),
                            Text('Mobile: ${booking.customerMobile}'),
                            SizedBox(height: 4),
                            Text('Date & Time: $formattedDate'),
                            SizedBox(height: 4),
                            Text('Rate: ₹${booking.serviceRate}'),
                            Text('Company: ${booking.companyName}'),
                            Text('Owner: ${booking.ownerName}'),
                          ],
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
