import 'package:flutter/material.dart';

class MobileVerification extends StatelessWidget {
  const MobileVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        children: [
          const Heading(
            label: AppContents.verifyMobileTitle,
            variant: Variant.large,
          ),
          const SizedBox(
            height: 15,
          ),
          const BodyText(label: AppContents.verifyMobileText),
          const SizedBox(
            height: 15,
          ),
          securityBox(),
          const SizedBox(
            height: 15,
          ),
          const MobileVerificationForm(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'By signing up, you are agreeing to our Terms & Conditions and Privacy Policy.',
            softWrap: true,
          ),
          const SizedBox(
            height: 15,
          ),
          BodyText(
            label: 'Last visited ${DateTime.now()}',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.red),
          )
        ],
      ),
    );
  }

  Container securityBox() {
    return Container(
      padding: globalPadding,
      height: 86,
      width: double.infinity,
      decoration: BoxDecoration(
        color: grayLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'We take privacy issues seriously. You can be sure that your personal data is securely protected.',
              softWrap: true,
              maxLines: 3,
              style: TextStyle(fontSize: 13),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.close)
        ],
      ),
    );
  }
}
