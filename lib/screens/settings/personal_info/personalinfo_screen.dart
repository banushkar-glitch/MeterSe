import 'package:flutter/material.dart';
import '../settings_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() =>
      _PersonalInfoScreenState();
}

class _PersonalInfoScreenState
    extends State<PersonalInfoScreen> {

  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final licenseController = TextEditingController();
  final vehicleController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    licenseController.dispose();
    vehicleController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dobController.text =
      "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child:Scaffold(
        resizeToAvoidBottomInset: false,

        body: SafeArea(
          child: Column(
            children: [

              /// HEADER
              Container(
                height: 99,
                width: double.infinity,
                color: const Color(0xFFFFD329),

                child: Row(
                  children: [

                    const SizedBox(width: 10),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),

                    const Expanded(
                      child: Text(
                        "Personal Information",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {

                        /// NOTIFICATION API

                      },
                      icon: const Icon(
                        Icons.notifications_none,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 10),
                  ],
                ),
              ),

              /// BODY
              Expanded(
                child: Container(
                  color: const Color(0xFFEAEAEA),

                  child: SingleChildScrollView(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),

                    child: Form(
                      key: _formKey,

                      child: Column(
                        children: [

                          const SizedBox(height: 15),

                          /// PROFILE IMAGE
                          InkWell(
                            onTap: () {

                              /// PICK IMAGE API

                            },
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Tap to change profile photo",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 15),

                          buildField(
                            label: "Full Name",
                            icon: Icons.badge,
                            controller: fullNameController,
                          ),

                          buildField(
                            label: "Phone Number",
                            icon: Icons.phone,
                            controller: phoneController,
                            keyboard:
                            TextInputType.phone,
                          ),

                          buildDateField(),

                          buildField(
                            label:
                            "Driving License Number",
                            icon: Icons.credit_card,
                            controller:
                            licenseController,
                          ),

                          buildField(
                            label: "Vehicle Number",
                            icon:
                            Icons.directions_car,
                            controller:
                            vehicleController,
                          ),

                          buildAddressField(),

                          const SizedBox(height: 10),

                          /// SAVE BUTTON
                          InkWell(
                            onTap: () {

                              if (_formKey.currentState!
                                  .validate()) {

                                /// SAVE API HERE

                                print(
                                    fullNameController
                                        .text);

                                print(
                                    phoneController
                                        .text);

                                print(
                                    dobController.text);

                                print(
                                    licenseController
                                        .text);

                                print(
                                    vehicleController
                                        .text);

                                print(
                                    addressController
                                        .text);
                              }
                            },

                            child: Container(
                              width: 209,
                              height: 45,

                              decoration: BoxDecoration(
                                color:
                                const Color(
                                    0xFFD9D9D9),
                                borderRadius:
                                BorderRadius.circular(
                                    25),
                              ),

                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// FOOTER
              Container(
                width: double.infinity,
                height: 99,
                color: const Color(0xFF3C3A3A),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboard =
        TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Padding(
            padding:
            const EdgeInsets.only(top: 32),
            child: Icon(icon, size: 32),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 5),

                SizedBox(
                  height: 65,

                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboard,

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },

                    decoration:
                    InputDecoration(
                      border:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                      ),
                      contentPadding:
                      const EdgeInsets
                          .symmetric(
                        horizontal: 10,
                      ),
                      errorStyle: const TextStyle(
                        height: 0.8,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          const Padding(
            padding:
            EdgeInsets.only(top: 32),
            child: Icon(
              Icons.calendar_month,
              size: 32,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                const Text(
                  "Date Of Birth",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 5),

                SizedBox(
                  height: 65,

                  child: TextFormField(
                    controller: dobController,
                    readOnly: true,

                    onTap: pickDate,

                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return "Required";
                      }
                      return null;
                    },

                    decoration:
                    InputDecoration(
                      border:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddressField() {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        const Padding(
          padding: EdgeInsets.only(top: 35),
          child: Icon(
            Icons.location_on,
            size: 32,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              const Text(
                "Address",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 5),

              SizedBox(
                height: 76,

                child: TextFormField(
                  controller:
                  addressController,
                  maxLines: 3,

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },

                  decoration:
                  InputDecoration(
                    border:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(
                          10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}