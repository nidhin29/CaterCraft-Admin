import 'package:catering/Application/View/view_cubit.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Presentation/common/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamViewPage extends StatelessWidget {
  const TeamViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ViewCubit>().getTeam();
    });

    return Scaffold(
      appBar: AppBar(title: Text("Team View")),
      body: BlocConsumer<ViewCubit, ViewState>(
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
            () => const Center(child: Text("No Owners")),
            (either) => either.fold(
              (failure) {
                return const Center(child: Text("No Owners"));
              },
              (owners) {
                return owners.owners!.isEmpty
                    ? const Center(child: Text("No Owners"))
                    : ListView.builder(
                      itemCount: owners.owners!.length,
                      itemBuilder: (context, index) {
                        final owner = owners.owners![index];
                        final statusText =
                            owner.status == 1 ? "Approved" : "Pending";
                        final statusColor =
                            owner.status == 1 ? Colors.green : Colors.orange;

                        return Card(
                          margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              owner.name!,
                              style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text("Company: ${owner.companyName}"),
                            Text("Mobile: ${owner.mobNo}"),
                            Text("Email: ${owner.emailIdOwner}"),
                            Text("Address: ${owner.address}"),
                            SizedBox(height: 6),
                            Row(
                              children: [
                              Text(
                                "Status: ",
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                statusText,
                                style: TextStyle(color: statusColor),
                              ),
                              ],
                            ),
                            if (owner.licenseDocument != null) ...[
                              SizedBox(height: 10),
                              Text("License Document:"),
                              SizedBox(height: 4),
                              Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                owner.licenseDocument,
                                fit: BoxFit.cover,
                                errorBuilder: (
                                context,
                                error,
                                stackTrace,
                                ) {
                                return Center(
                                  child: Text("Document not viewable"),
                                );
                                },
                              ),
                              ),
                            ],
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                              onPressed: () {
                                context
                                  .read<ViewCubit>()
                                  .deleteCustomer(owner.emailIdOwner!);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text("Delete"),
                              ),
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
}
