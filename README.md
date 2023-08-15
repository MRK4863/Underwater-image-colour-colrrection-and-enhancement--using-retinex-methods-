# Underwater image colour correction and enhancement using retinex methods 

Underwater images often suffer from degradation due to poor visibility and scattering, leading to color loss and reduced illumination, especially in the red channel. This project replicates a color correction algorithm for underwater images. The algorithm leverages Color Filter Array (CFA) properties in cameras to enhance color and illumination. It also employs a Retinex model for illumination improvement and adaptive histogram equalization for enhanced contrast. The algorithm's effectiveness was tested on various images. The main goal is to restore underwater images' colors and contrast for better analysis and inference in research and exploration.

The project successfully implemented an underwater image color correction algorithm based on the publication. This algorithm enhances images in steps, addressing issues caused by red channel attenuation and scattering underwater. By restoring original colors and contrast, it improves the usability of underwater images for analysis and exploration.

The motivation was to apply practical image processing techniques to previously challenging colored images. The publication lacked details about the retinex enhancement, prompting deeper investigation. Ensuring compatibility between processing steps and understanding intermediate data types were crucial. The project's future scope includes automating parameter tuning and improving computational efficiency due to the time-consuming retinex computation.

### Stage-wise results obtained
Raw image

<img src = "IMAGE_RESULTS/1_raw_img_8_FRANKLE.png " alt="Raw image" />

Red-channel compensation
<img src="IMAGE_RESULTS/2_red_channel_8_FRANKLE.png" alt="Red-channel compensation" />

White balancing
<img src="IMAGE_RESULTS/2_red_channel_8_FRANKLE.png" alt="Red-channel compensation" />

Retinex for improving illumination
<img src="IMAGE_RESULTS/4_img_retinex_rgb_8_FRANKLE.png" alt="Retinex" />

Histogram Equalization
<img src="IMAGE_RESULTS/5_histeq_img_8_FRANKLE.png" alt="Histogram Equalization" />

Disclaimer:
This is an implementation of this orginal paper: https://github.com/MRK4863/Underwater-image-colour-colrrection-and-enhancement--using-retinex-methods-/blob/main/READING_AND_REFERENCE_MATERIALS/BASE_PAPER.pdf
