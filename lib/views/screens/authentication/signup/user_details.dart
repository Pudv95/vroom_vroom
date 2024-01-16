import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vroom_vroom/services/authentication/user_details.dart';
import 'package:vroom_vroom/utils/contants/colors/app_colors.dart';
import 'package:vroom_vroom/utils/providers/authentication/signup_provider.dart';

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
    final state = context.watch<SignUpProvider>();
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
          onChanged: (value) => state.setName(value),
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
                  onChanged: (value) => state.setGender(value),
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
                                top: ages.indexOf(value) == 0 ? Radius.zero : const Radius.circular(20.0),
                                bottom: ages.indexOf(value) == ages.length - 1 ? Radius.zero : const Radius.circular(20.0),
                              ),
                            ),
                            child: Text(value)
                        ),
                      );
                    }).toList(),
                    onChanged: (value) => state.setAge(value)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: (234 / height) * height,
        ),
        ElevatedButton(
            onPressed: () async {
              print(state.user.toJson());
               String? success = await addUserDetails(state.user.name ?? 'Paras', 10, state.user.gender!, state.user.accessToken!);
               if(success != null){
                 print('couldn\'t process');
               }
               else{
                 context.go('/');
               }
            },
            child: Text(
              'Next',
              style: Theme.of(context).textTheme.labelLarge,
            ))
      ],
    );
  }
}
