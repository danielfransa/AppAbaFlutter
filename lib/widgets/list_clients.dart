import 'package:aba_app/core/constants.dart';
import 'package:aba_app/core/utils.dart';
import 'package:aba_app/models/client.dart';
import 'package:aba_app/pages/client_detail.dart';
import 'package:aba_app/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

class ListClients extends StatelessWidget {
  const ListClients({super.key, required this.client});

  final Client client;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ClientDetail(
                  client: client,
                )),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: AvatarWidget(
                dataImage: kBase64Image,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    client.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Email: ${client.email}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(
                    'Idade: ${calculateAge(client.birthday)} anos',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// List<Client> createList(BuildContext context) {
//   // Gerar lista de Widgets com 20 elementos
//   return List.generate(3, (index) {
//     // Gerar um objeto da nossa model class a partir do Faker()
//     final client = Client.fromFaker(faker);

//     // Gerar Card com os dados a partir do objeto feed
//     return

// Card(
//   child: ListTile(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: ((context) => ClientDetail()),
//         ),
//       );
//     },
//     leading: CircleAvatar(backgroundImage: NetworkImage(client.imageUrl)),
//     title: Text(
//       client.name,
//     ),
//     subtitle: Text(client.email),
//   ),
// );
//   });
// }
