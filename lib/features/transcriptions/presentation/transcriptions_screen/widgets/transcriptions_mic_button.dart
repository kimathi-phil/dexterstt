part of '../transcriptions_screen.dart';

class TranscriptionsMicButton extends StatelessWidget {
  const TranscriptionsMicButton({
    super.key,
    required this.iconData,
    required this.title,
    required this.onBtnSelected,
  });

  final IconData iconData;
  final String title;
  final VoidCallback onBtnSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBtnSelected,
      child: Container(
        width: double.infinity,
        height: size * 20,
        child: Material(
          color: kTransparentColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size * 7,
                height: size * 7,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(size * 6)),
                ),
                child: Icon(
                  iconData,
                  size: size * 4,
                  color: kWhiteColor,
                ),
              ),
              const SizedBox(height: size - 2),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: kPrimaryColor,
                    ),
              ),
              const SizedBox(width: size * 2),
            ],
          ),
        ),
      ),
    );
  }
}
