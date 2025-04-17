import 'package:catering/Application/View/view_cubit.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ViewCubit>().getCustomer();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
        backgroundColor: Colors.blueAccent.shade700,
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: BlocConsumer<ViewCubit, ViewState>(
        listener: (context, state) {
          state.isCustomerFailureOrSuccess.fold(
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

          return state.isCustomerFailureOrSuccess.fold(
            () => const Center(child: Text("No Customers")),
            (either) => either.fold(
              (failure) {
                return const Center(child: Text("No Customers"));
              },
              (customers) {
                return customers.customers!.isEmpty
                    ? const Center(child: Text("No Customers"))
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: customers.customers!.length,
                      itemBuilder: (context, index) {
                        final customer = customers.customers![index];
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _infoRow("Name", customer.name!),
                                _infoRow("Email", customer.emailIdCustomer!),
                                _infoRow("Mobile", customer.mobNo!),
                                _infoRow("Address", customer.address!),
                                _infoRow("ID Proof", customer.idProof!),
                                _infoRow(
                                  "Status",
                                  customer.status == 1 ? "Active" : "Inactive",
                                ),
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

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
