import 'package:flutter/material.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String selectedGender = 'Gender';
  String selectedAge = 'Age';
  List<String> ages = [
  'Below 18','18-22','22-26'
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        SizedBox(
          height: (65 / height) * height,
        ),
        Center(
          child: Text(
            'Tell about yourself',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: (16 / height) * height,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'We would like to know more about you.\nLet\'s start with some basics.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: (71 / height) * height,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: '   Name',
            filled: true,
            fillColor: AppColors.secondaryColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: (18 / height) * height,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondaryColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  isExpanded: true,
                  hint: Text(
                    '     Gender',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  items: <String>[
                    'Male','Female','Other'
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                  dropdownColor: AppColors.secondaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(9),
                child: DropdownButtonFormField(

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.secondaryColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    isExpanded: true,
                    hint: Text(
                      '     Age',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    items: ages
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: ages.indexOf(value) == 0 ? Radius.zero : Radius.circular(20.0),
                                bottom: ages.indexOf(value) == ages.length - 1 ? Radius.zero : Radius.circular(20.0),
                              ),
                            ),
                            child: Text(value)
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {}),
              ),
            ),
          ],
        ),
        SizedBox(
          height: (234 / height) * height,
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Next',
              style: Theme.of(context).textTheme.labelLarge,
            ))
      ],
    );
  }
}
