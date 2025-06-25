import 'dart:math';

class CalculateMonthlySavingUseCase {
  /// Calculates the required monthly saving to reach a passive income goal.
  ///
  /// [monthlyPassiveIncomeGoal]: The desired monthly passive income
  /// (e.g., 1000 for $1,000/month).
  /// [annualReturnRate]: The expected annual return rate as a percentage
  /// (e.g., 8 for 8%).
  /// [years]: The number of years to reach the goal.
  ///
  /// Returns the required monthly saving amount.
  double call({
    required double monthlyPassiveIncomeGoal,
    required double annualReturnRate,
    required int years,
  }) {
    // Calculate the required capital to generate the desired passive income
    final requiredCapital =
        (monthlyPassiveIncomeGoal * 12) / (annualReturnRate / 100);

    // Monthly interest rate
    final monthlyRate = (annualReturnRate / 100) / 12;
    final months = years * 12;

    // S = FV * i / ((1 + i)^n - 1)
    final numerator = requiredCapital * monthlyRate;
    final denominator = pow(1 + monthlyRate, months) - 1;

    if (denominator == 0) {
      throw ArgumentError('Invalid parameters: denominator is zero.');
    }

    return numerator / denominator;
  }
}
