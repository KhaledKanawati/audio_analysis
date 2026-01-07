

## Overview
This project is focused on extracting, analyzing, and visualizing acoustic features from voice recordings of multiple patients. The goal is to process audio data to obtain quantitative measures of speech and voice characteristics for research or clinical analysis.

## Main Steps

0. **Voice Cleaning**: Audacity is used to clear out any interviewer speech manually, or silence any extra loud noise or background speech when the patient isn't talking. An attempt to automate this using whisper and pyannote 3.0 from hugging face were tried but couldn't bring them to work (model failed to load, see whisper.ipynb for more). Furthermore, the different sections are each kept seperately and features from them extracted seperately, combined in the total csv file discussed below.
1. **Run Audio Diagnosis**: Need to determine appropriate frequencies to work with, we do that by analyzing the different voices.
2. **Feature Extraction**: Python scripts and Jupyter notebooks extract features such as:
   - Speech rate, articulation rate
   - Pause statistics (number, duration)
   - Prosodic features (pitch/F0, intensity, jitter, shimmer, HNR)
   - Spectral features (MFCCs)
3. **Data Aggregation**: All features are combined into a single CSV file for each patient (acoustic_features_patient1.csv), and than one csv for the original 3 patients for all voice sections (acoustic_features_all_patients.csv). And one csv file for the entirity of the 40 patients (acoustic_features_all_patients_pipelined.csv).
4. **Visualization**: Boxplots and dashboards are generated to verify feature extraction and compare patients or groups.
5. **Verification**: Individual audio files can be visualized for manual inspection of feature extraction accuracy.

## Key Files
- `extract.ipynb`: Main notebook for feature extraction, summary, and visualization.
- `extract2.ipynb`: Same as above but for the 40 audio samples.
- `acoustic_features_all_patients.csv`: Combined features for all patients.
- `acoustic_features_summary.csv`: Summary statistics.
- `pipelined recordings/`, `Voice samples 1/`, etc.: Folders containing audio files.
- `voice analysis.ipynb`: Notebook for voice analysis and figurign out appropriate ranges for frequency and others.
- `whisper.ipynb`: A failed attempt at trying to clean the voice data automatically using pyannote.

## Requirements
- Python 3.x
- Libraries: pandas, numpy, librosa, parselmouth, matplotlib, seaborn

The CSV files can be reviewed as shown above


## Tools and Libraries Used

This project uses the following main tools and libraries:

- **pandas**: For data manipulation, tabular storage, and CSV export.
- **numpy**: For efficient numerical operations and array handling.
- **librosa**: For audio loading, feature extraction (RMS, MFCCs, spectral features), and signal processing.
- **parselmouth (Praat)**: For advanced prosodic analysis, including pitch (F0), jitter, shimmer, and HNR extraction using Praat algorithms.
- **matplotlib**: For creating static plots and visualizations of extracted features.
- **seaborn**: For enhanced statistical data visualization and styled plots.
- **scipy**: For signal processing utilities (e.g., peak detection, smoothing).
- **Audacity Software**: For manually preprocessing the voice recordings to remove noise and extract only useful/relevant parts.

# Voice Acoustic Feature Extraction Project


## Note:

The 40 voice recordings sample was not yet fully cleaned/processed, we hope to do that soon.