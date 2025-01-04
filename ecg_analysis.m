file_name = 'ecg_data.csv';
if ~isfile(file_name)
    error('File "%s" not found. Ensure the file exists in the current directory.', file_name);
end
data = readtable(file_name);
if ~ismember('Time', data.Properties.VariableNames) || ~ismember('ECG', data.Properties.VariableNames)
    error('CSV file must contain columns named ''Time'' and ''ECG''.');
end

t = data.Time; % Time column (seconds)
ecg_signal = data.ECG; % ECG signal column
ecg_signal = ecg_signal * 1000; % Convert to mV (if needed)

fs = 1 / mean(diff(t)); % Hz

low_hr_threshold = 50; % bpm (beats per minute)

[~, r_peak_locs] = findpeaks(ecg_signal, 'MinPeakHeight', 0.5, 'MinPeakDistance', 0.6 * fs);

figure;
plot(t, ecg_signal);
hold on;
plot(t(r_peak_locs), ecg_signal(r_peak_locs), 'ro');
title('ECG Signal with Detected R-peaks');
xlabel('Time (s)');
ylabel('Amplitude (mV)');
grid on;

r_peak_intervals = diff(t(r_peak_locs)); % Time intervals between R-peaks (s)
heart_rate = 60 ./ r_peak_intervals; % Convert intervals to heart rate (bpm)

heart_rate = smoothdata(heart_rate, 'movmean', 3); % 3-point moving average

low_heart_rate = heart_rate < low_hr_threshold;

disp('Heart Rate (bpm):');
disp(heart_rate);

if any(low_heart_rate)
    disp('WARNING: Low heart rate (low_heart_rate) detected in the following intervals:');
    disp(find(low_heart_rate));
else
    disp('Heart rate is normal.');
end

results = table((1:length(heart_rate))', heart_rate, low_heart_rate, ...
    'VariableNames', {'Interval', 'HeartRate_bpm', 'low_heart_rate'});
writetable(results, 'ecg_results.csv');
disp('Results saved to "ecg_results.csv".');
