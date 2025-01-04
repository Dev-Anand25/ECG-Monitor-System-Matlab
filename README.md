# ECG Monitoring System

This MATLAB-based ECG Monitoring System processes ECG data from a CSV file, detects R-peaks, calculates heart rate, and checks for low heart rate. It saves the results to a new CSV file, providing insights into the ECG signal and heart rate variations.

## Requirements
- MATLAB (any recent version)
- A CSV file containing ECG data with two columns: `Time` (in seconds) and `ECG` (ECG signal amplitude, typically in volts)

## Input File Format
The input CSV file must contain at least two columns:
- **Time**: Time in seconds (e.g., 0.0, 0.1, 0.2, ...)
- **ECG**: ECG signal amplitudes (e.g., 0.1, 0.3, 0.2, ...)

