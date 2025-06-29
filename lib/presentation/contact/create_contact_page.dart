import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_recru_design/core/assets.dart';
import 'package:my_recru_design/presentation/widgets/take_picture_widget.dart';
import 'package:my_recru_design/presentation/widgets/text_field.dart';

class CreateContactPage extends StatefulWidget {
  const CreateContactPage({super.key});

  @override
  CreateContactPageState createState() => CreateContactPageState();
}

class CreateContactPageState extends State<CreateContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Créer un contact',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Veuillez entrez les informations de contact',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    SizedBox(height: 40),

                    // Photo de profil
                    Center(child: Stack(children: [TakePictureWidget()])),

                    SizedBox(height: 40),

                    TextFieldWidget(labelText: "Nom"),

                    SizedBox(height: 10),

                    TextFieldWidget(labelText: "Nom"),

                    SizedBox(height: 10),

                    TextFieldWidget(labelText: "Entreprise"),

                    SizedBox(height: 16),

                    TextFieldWidget(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              SvgIconConstants.ciFlag,
                              height: 20,
                            ),
                            const SizedBox(width: 5),
                            Text("+225"),
                          ],
                        ),
                      ),
                      inputFontSize: 16,
                      labelText: "Numero de telephone",
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                    ),

                    SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Ajouter un numéro',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 20,

                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    _otherField('Adresse mail'),
                    _otherField("Date d'anniversaire"),
                    _otherField('Ajouter une adresse'),

                    SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        _showFieldSelectionModal(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Ajouter des champs supplémentaires',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherField(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
        ),
      ),
    );
  }

  void _showFieldSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FieldSelectionModal(),
    );
  }
}

class FieldSelectionModal extends StatelessWidget {
  final List<String> fields = [
    'Intitulé du poste',
    'Préfixe',
    'Suffixe',
    'Pseudo',
    'Classer en tant que',
    'Intitulé du poste',
    'Service',
    'Relations',
    'Site Web',
  ];

  FieldSelectionModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 10,
                    right: 30,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        "Sélectionner les champs à ajouter",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(20),
                //       topRight: Radius.circular(20),
                //     ),
                //     border: Border(
                //       bottom: BorderSide(color: Colors.grey.shade200),
                //     ),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: ,
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(20),
                      //   topRight: Radius.circular(20),
                      // ),
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 140),

                      shrinkWrap: true,
                      itemCount: fields.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              fields[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
