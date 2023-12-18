part of '../transcriptions_screen.dart';

class TranscriptionsScreenNavbar extends StatelessWidget {
  const TranscriptionsScreenNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: size * 5.0,
          width: size * 5.0,
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.person_2_rounded),
          ),
        ),
        Text(
          'Eren ',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: kBlackColor800),
        ),
      ],
    );
  }
}
