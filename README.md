# ECG Heart Rate Analysis & Bradycardia Detection

This MATLAB script analyzes an ECG signal from a `.csv` file to detect R-peaks, calculate the heart rate, and identify potential instances of bradycardia (abnormally low heart rate).

The script visualizes the detected peaks on the ECG waveform and saves the heart rate analysis results to a new `.csv` file.

-----

## Features 

  * **Data Loading**: Reads time-series ECG data from a `.csv` file.
  * **R-Peak Detection**: Automatically identifies R-peaks using the `findpeaks` function.
  * **Heart Rate Calculation**: Calculates beat-to-beat heart rate in beats per minute (bpm).
  * **Data Smoothing**: Applies a moving average filter to smooth the heart rate data.
  * **Bradycardia Detection**: Flags intervals where the heart rate drops below a customizable threshold.
  * **Visualization**: Generates a plot of the ECG signal with detected R-peaks marked for verification.
  * **Results Export**: Saves the interval-by-interval heart rate and bradycardia flags to `ecg_results.csv`.

-----

## Requirements

  * **MATLAB** (R2018b or newer recommended)
  * **Signal Processing Toolbox™**: Required for the `findpeaks` and `smoothdata` functions.

-----

## How to Use 

1.  **Prepare Your Data**:

      * Ensure your ECG data is in a `.csv` file named `ecg_data.csv`.
      * The file **must** contain two columns with the exact headers: `Time` (in seconds) and `ECG` (signal amplitude).
      * Place the `ecg_data.csv` file in the same directory as the MATLAB script.

2.  **Run the Script**:

      * Open MATLAB.
      * Navigate to the directory containing the script and the data file.
      * Run the script from the MATLAB editor or command window.

3.  **Check the Output**:

      * A plot will be displayed showing the ECG signal and the detected R-peaks.
      * The calculated heart rate and any bradycardia warnings will be printed in the MATLAB Command Window.
      * A new file, `ecg_results.csv`, will be created in the directory with the detailed analysis.

-----

## Customization️

You can easily modify the script's parameters to suit your specific data:

  * **Input File Name**: Change the `file_name` variable on the first line to use a different data file.
    ```matlab
    file_name = 'my_ecg_data.csv';
    ```
  * **Bradycardia Threshold**: Adjust the `low_hr_threshold` to change the definition of a low heart rate. The default is 50 bpm.
    ```matlab
    low_hr_threshold = 60; % Set low heart rate threshold to 60 bpm
    ```
  * **Peak Detection Parameters**: Fine-tune the `findpeaks` parameters for cleaner or noisier signals.
      * `'MinPeakHeight'`: Increase this value for high-amplitude signals or to avoid detecting T-waves.
      * `'MinPeakDistance'`: Adjust this based on the expected heart rate range to avoid false detections.
    <!-- end list -->
    ```matlab
    [~, r_peak_locs] = findpeaks(ecg_signal, 'MinPeakHeight', 0.8, 'MinPeakDistance', 0.5 * fs);
    ```

-----
