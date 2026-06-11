# High-Spatial-Resolution Optical Cavity Ring-Down Imaging

## Overview

This project explores a high-spatial-resolution imaging method for optical element inspection based on cavity ring-down detection. High-power laser systems rely on high-performance optical components, and local defects or non-uniform loss in these components can directly affect system performance. Therefore, high-resolution loss imaging is important for evaluating and developing high-quality laser optics.

Conventional cavity ring-down measurements often use laser beam diameters at the millimetre or sub-millimetre scale, which limits spatial resolution. This project investigates a focused-beam cavity ring-down configuration to improve spatial resolution and obtain reflectivity/loss images of optical elements.

## Repository Structure

```text
high-resolution-cavity-ringdown-imaging/
│
├── README.md
├── figures/
│   ├── optical_setup.png
│   ├── gaussian_beam_model.png
│   ├── scanning_imaging_workflow.png
│   └── deconvolution_result.png
│
├── scripts/
│   ├── gaussian_beam_model.m
│   ├── deconvolution_demo.py
│   └── plot_reflectivity_map.py
│
├── sample_data/
│   └── demo_reflectivity_map.csv
│
└── docs/
    └── project_summary.pdf
```

## Background

Cavity ring-down is a sensitive optical loss measurement technique. Instead of directly measuring transmitted optical power, it evaluates the decay time of light inside an optical cavity. Since the decay time is related to the total cavity loss, small changes in mirror reflectivity or optical element loss can be detected with high sensitivity.

For imaging applications, the laser beam is scanned across different positions of the optical element. By measuring the ring-down signal at each point, a spatial map of local optical loss or reflectivity can be reconstructed.

## Project Objectives

* Develop a high-spatial-resolution cavity ring-down imaging workflow for optical element inspection.
* Improve spatial resolution by using a focused laser beam configuration.
* Model Gaussian beam propagation and focusing behaviour in the optical cavity.
* Analyse imaging results obtained under different beam sizes and focusing conditions.
* Apply computational post-processing to reduce the influence of finite beam spot size on the measured image.

## Methodology

The project combines optical system modelling, experimental measurement design and data processing.

### 1. Optical System Design

A focused laser beam configuration was introduced into the cavity ring-down setup to reduce the scanning spot size on the optical element. The optical path and beam propagation were modelled to evaluate how lens-assisted focusing affects the beam waist inside the cavity.

### 2. Gaussian Beam Modelling

Gaussian beam propagation was analysed to estimate the beam size at the target optical surface. The focusing configuration was designed to reduce the effective beam waist and improve the spatial resolution of reflectivity mapping.

### 3. Scanning-Based Imaging

The optical element was treated as a spatially varying sample. By scanning the focused beam across different positions and recording the corresponding cavity ring-down signals, a two-dimensional reflectivity or loss map could be reconstructed.

### 4. Deconvolution-Based Image Processing

Because the measured signal is influenced by the finite Gaussian beam spot size, the measured image can be regarded as a convolution between the real reflectivity distribution and the beam intensity profile. A deconvolution method was used to reduce this convolution effect and improve the recovery of local reflectivity information.

## Key Results

* Designed a focused-beam cavity ring-down imaging approach for high-resolution optical element inspection.
* Modelled lens-assisted Gaussian beam focusing and reduced the simulated beam waist from approximately 1 μm to 0.4 μm.
* Developed a deconvolution-based processing method to reduce spot-size convolution effects.
* Improved the ability to recover local reflectivity information from measured imaging data.
* Achieved reflectivity mapping accuracy at the 0.01% level in the processed results.

## Tools and Techniques

* Optical system modelling
* Gaussian beam propagation analysis
* Cavity ring-down measurement
* Scanning-based optical imaging
* Deconvolution image processing
* MATLAB
* Zemax
* Python / NumPy / Matplotlib

## Example Workflow

1. Model the Gaussian beam propagation in the cavity.
2. Estimate the focused beam waist on the optical element.
3. Simulate or measure the ring-down signal at different scan positions.
4. Reconstruct the spatial reflectivity/loss map.
5. Apply deconvolution to reduce the finite-spot-size effect.
6. Compare raw and processed imaging results.

## Notes

The files in this repository are prepared as a simplified project portfolio version. Any sensitive raw experimental data, unpublished laboratory information or institution-specific internal files should be removed or replaced with anonymised sample data before public release.

## Keywords

Optical imaging, cavity ring-down, optical loss measurement, Gaussian beam, reflectivity mapping, optical element inspection, deconvolution, Zemax, MATLAB, Python.
