import 'package:flutter/material.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() {
    return _LoanScreenState();
  }
}

class _LoanScreenState extends State<LoanScreen> {
  int _activeStepIndex = 0;
  List<Step> stepList() => [
        Step(
          isActive: _activeStepIndex == 0,
          title: StepCard(
            label: 'Step 1',
            isActive: _activeStepIndex == 0,
          ),
          content: const UploadDocument(),
        ),
        Step(
          isActive: _activeStepIndex == 1,
          title: StepCard(
            label: 'Step 2',
            isActive: _activeStepIndex == 1,
          ),
          content: const PersonalDetails(),
        ),
        Step(
          isActive: _activeStepIndex == 2,
          title: StepCard(
            label: 'Step 3',
            isActive: _activeStepIndex == 2,
          ),
          content: const Center(
            child: Text("Step 3"),
          ),
        ),
        Step(
          isActive: _activeStepIndex == 3,
          title: StepCard(
            label: 'Step 4',
            isActive: _activeStepIndex == 2,
          ),
          content: const Center(
            child: Text("Step 4"),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    Widget screen = Stepper(
      elevation: 0,
      currentStep: _activeStepIndex,
      type: StepperType.horizontal,
      physics: const ClampingScrollPhysics(),
      steps: stepList(),
      onStepTapped: (value) {
        if (_activeStepIndex == (stepList().length - 1)) return;
        setState(() {
          _activeStepIndex += 1;
        });
      },
      onStepCancel: () {
        if (_activeStepIndex == 0) return;
        setState(() {
          _activeStepIndex -= 1;
        });
      },
      onStepContinue: () {
        if (_activeStepIndex < (stepList().length - 1)) {
          setState(() {
            _activeStepIndex += 1;
          });
        }
      },
    );
    if (_activeStepIndex == 4) {
      screen = const Success();
    }
    return Scaffold(
      appBar: const NavBar(
        title: 'Loan wizard',
      ),
      body: SafeArea(
        child: screen,
      ),
    );
  }
}
