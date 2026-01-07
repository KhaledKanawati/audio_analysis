

## Overview
This project is focused on extracting, analyzing, and visualizing acoustic features from voice recordings of multiple patients. The goal is to process audio data to obtain quantitative measures of speech and voice characteristics for research or clinical analysis.

## Main Steps

0. **Voice Cleaning**: 
   - Manual cleaning using Audacity to remove interviewer speech, background noise, and non-patient audio
   - **Automated speaker separation** using `whisperx_separation.ipynb` with WhisperX and pyannote.audio 3.4.0 for diarization-based speaker separation
   - Different sections are kept separately and features extracted individually

1. **Run Audio Diagnosis**: 
   - `voice analysis.ipynb`: Analyze original voice samples to determine appropriate frequency ranges
   - `voice_analysis_manual.ipynb`: Analyze cleaned_manual folder recordings for optimal extraction parameters
   - Results inform pitch floor/ceiling and formant settings for feature extraction

2. **Feature Extraction**: Python scripts and Jupyter notebooks extract features such as:
   - Speech rate, articulation rate
   - Pause statistics (number, duration)
   - Prosodic features (pitch/F0, intensity, jitter, shimmer, HNR)
   - Spectral features (MFCCs, formants F1/F2/F3)
   - All features use Parselmouth (Praat) for accurate acoustic analysis

3. **Data Aggregation**: 
   - Individual patient CSV files (acoustic_features_patient1.csv, etc.)
   - Combined CSV for original 3 patients (acoustic_features_all_patients.csv)
   - Pipelined recordings CSV (acoustic_features_all_patients_pipelined.csv)

4. **Visualization**: Boxplots and dashboards are generated to verify feature extraction and compare patients or groups.

5. **Verification**: Individual audio files can be visualized for manual inspection of feature extraction accuracy.

## Key Files

### Notebooks
- `extract.ipynb`: Original feature extraction notebook (pitch: 40-500 Hz)
- `extract2.ipynb`: Feature extraction for cleaned_manual folder (pitch: 40-600 Hz)
- `voice analysis.ipynb`: Voice parameter analysis for original recordings
- `whisperx_separation.ipynb`: **Working** automated speaker separation using WhisperX diarization, recognizes the 2 speakers and generates 2 audio files per file, where audiofile_1.wav is the file with only the voice of the most talkative speaker, and audiofile_2.wav is the file with only the second most talkative (we select which we want after the fact)

### Data Files
- `acoustic_features_all_patients.csv`: Combined features for original 3 patients
- `acoustic_features_cleaned_manual.csv`: Features for all 40 pipelined recordings
- `acoustic_features_summary.csv`: Summary statistics
- Individual patient files: `acoustic_features_patient1.csv`, etc.

### Audio Folders
- `Voice samples 1/`, `voice sample 2/`, `voice sample 3/`: Original recordings
- `pipelined recordings/`: Processed recordings for 40 patients
- `cleaned recordings/`: Earlier filtered versions of the pipelined recordings, done automatically through PyannoteAI, where only one voice remains (not super consistent but helps a lot in the later manual filtering).
- `cleaned_manual/`: **Manually cleaned recordings** (40 files)

## Requirements
- Python 3.x
- Libraries: pandas, numpy, librosa, parselmouth, matplotlib, seaborn

The CSV files can be reviewed as shown above


## Tools and Libraries Used

This project uses the following main tools and libraries:

- **pandas**: For data manipulation, tabular storage, and CSV/Excel export
- **numpy**: For efficient numerical operations and array handling
- **librosa**: For audio loading, feature extraction (RMS, MFCCs, spectral features), and signal processing
- **praat-parselmouth**: For advanced prosodic analysis, including pitch (F0), formants, jitter, shimmer, and HNR extraction using Praat algorithms
- **matplotlib**: For creating static plots and visualizations of extracted features
- **seaborn**: For enhanced statistical data visualization and styled plots
- **scipy**: For signal processing utilities (e.g., peak detection, smoothing, filtering)
- **openpyxl**: For Excel file reading and writing
- **WhisperX**: For automated speaker diarization and separation
- **pyannote.audio 3.4.0**: For speaker diarization models (segmentation-3.0, speaker-diarization-3.1)
- **torch/torchvision/torchaudio**: PyTorch dependencies for WhisperX
- **Audacity Software**: For manually preprocessing the voice recordings to remove noise and extract only useful/relevant parts

# Voice Acoustic Feature Extraction Project


## Processing Status

- ✅ Original 3 patients: Fully processed with CSV outputs
- ✅ 40 pipelined recordings: Features extracted to CSV
- ✅ **cleaned_manual folder**: 40 manually cleaned recordings analyzed and extracted to Excel
- ⚙️ **whisperx_separation.ipynb**: Automated speaker separation available for batch processing

## Extraction Parameters

### extract.ipynb (Original)
- Pitch Floor: 40 Hz
- Pitch Ceiling: 500 Hz
- Max Formant: 5500 Hz
- Number of Formants: 5

### extract2.ipynb (Cleaned Manual)
- Pitch Floor: 40 Hz  
- Pitch Ceiling: 600 Hz
- Max Formant: 5500 Hz
- Number of Formants: 5
- Output: Excel with summary statistics sheet