# Numerical Methods & Signal Processing Suite

A comprehensive collection of numerical analysis, audio signal processing, and polynomial interpolation algorithms implemented in MATLAB / GNU Octave.

## Core Modules

### 1. Digital Audio & Music Synthesis (`numerical_music/`)
- **Sound & Waveform Generation:** Custom oscillator function for basic waveform synthesis.
- **Audio Processing:** Stereo-to-mono conversion, high-pass filtering, and impulse response reverb application.
- **Frequency Analysis:** Custom spectrogram calculation using Discrete Fourier Analysis and visual plotting utilities.

### 2. Recommendation Engine (`recommendations/`)
- **Vector Space Modeling:** Cosine similarity metric calculation between feature vectors.
- **Data Pipeline:** Matrix preprocessing and dataset import tools for basic recommendation algorithms.

### 3. Robotic Path Interpolation (`robotzii/`)
- **Trajectory Modeling:** Smooth motion path calculations using Natural Cubic Splines ($C^2$ continuity) and Vandermonde polynomial systems.
- **Visual Analytics:** Plotting scripts to compare interpolation techniques against trajectory sample data.

## Environment Requirements

- **MATLAB** (R2018b or newer) or **GNU Octave** (v5.0+)

## Quick Start

1. Open MATLAB/Octave inside the root directory.
2. Load all subdirectories into your working path:
   ```matlab
   addpath(genpath('.'));

    Test audio synthesis or trajectory modeling scripts directly from their module folders.

License

MIT License
