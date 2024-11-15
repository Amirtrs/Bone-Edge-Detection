# Bone Edge Detection and Contour Overlay

This project performs edge detection and contour overlay on bone images using MATLAB. The process includes Gaussian filtering, Sobel edge detection, Hough transform, and active contour segmentation.

## Project Details

- **Filtering**: Gaussian filter is applied to smooth the image and reduce noise.
- **Edge Detection**: Sobel edge detection method is used, followed by morphological operations to close the edges.
- **Hough Transform**: The Hough transform is applied to detect specific angles in the edge-detected images.
- **Active Contour Segmentation**: The Chan-Vese method is used to segment the bone regions, providing a precise contour.

## Getting Started

### Prerequisites

- MATLAB with Image Processing Toolbox

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Amirtrs/Bone-Edge-Detection.git
Open MATLAB and navigate to the cloned folder.
Run the main script to perform the edge detection and contour overlay.
Usage
To execute the project:

Ensure that the required image (4.jpg or any image of interest) is in the same directory as the script.
Run the script in MATLAB, which will display several stages of processing, including:
Gaussian-filtered image
Detected edges with Sobel operator
Hough transform analysis
Final contour overlay on the original image
Code Explanation
Filtering: A Gaussian filter is applied to smooth the image, controlled by parameter B.
Edge Detection: The Sobel method is used to detect edges, followed by morphological operations to close small gaps in the edges.
Hough Transform: The Hough transform is used to find prominent angles within the detected edges. Peaks are identified based on a threshold.
Active Contour Segmentation: The activecontour function uses the Chan-Vese method to refine the segmentation of the bone regions.
Example Output
After running the script, the original image will be displayed with the detected contours overlaid, allowing for visual verification of the segmentation.





