part of '../transcriptions_screen.dart';

class TranscriptionsScreenNavbar extends StatelessWidget {
  const TranscriptionsScreenNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(
              height: size * 5.0,
              width: size * 5.0,
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: Icon(Icons.person_2_rounded),
              ),
            ),
            SizedBox(width: size + 4),
            Text(
              'Eren',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: kBlackColor800),
            ),
          ],
        ),
        SizedBox(
          width: size * 4,
          height: size * 4,
          child: Icon(Icons.more_vert_sharp),
        ),
      ],
    );
  }
}
