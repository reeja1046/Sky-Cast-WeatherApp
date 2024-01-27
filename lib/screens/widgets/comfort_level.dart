
import 'package:flutter/material.dart';
import 'package:sky_cast_weatherapp/model/weather_data_current.dart';
import 'package:sky_cast_weatherapp/utils/custom_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ComfortLevelWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevelWidget({
    super.key,
    required this.weatherDataCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: const Text(
            'Comfort Level',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          //height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 2,
                      trackWidth: 14,
                      progressBarWidth: 14,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: 'Humidity',
                      bottomLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        letterSpacing: 0.3,
                      ),
                    ),
                    animationEnabled: true,
                    size: 150,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor:
                          CustomColors.firstGradientColor.withAlpha(120),
                      progressBarColors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor,
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Feels Like ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.8,
                            color: CustomColors.textColorsBlack,
                          ),
                        ),
                        TextSpan(
                          text: '${weatherDataCurrent.current.feelsLike}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.8,
                            color: CustomColors.textColorsBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 1,
                    color: CustomColors.dividerLine,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Uv Index ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.8,
                            color: CustomColors.textColorsBlack,
                          ),
                        ),
                        TextSpan(
                          text: '${weatherDataCurrent.current.uvIndex}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 0.8,
                            color: CustomColors.textColorsBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
