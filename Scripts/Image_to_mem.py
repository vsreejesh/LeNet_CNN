from PIL import Image
import numpy as np

# --- 1. Load and Process the Image ---
filename = "pixel_digit.png"  # Make sure this file is uploaded

# Open image, convert to grayscale, resize to 28x28
img = Image.open(filename).convert('L')
img = img.resize((28, 28))

# Convert to array and normalize (dividing by 255.0 is crucial for your math below)
I = np.array(img) / 255.0 

# --- 2. Your Exact Output Loop ---
N = 28
K = 28

for i in range(0 , N):
  for j in range(0 , K):
    # This logic matches your original request
    if (int(256*I[i][j])>=0):
      print ('{:032b}'.format(int(256*I[i][j])))
    else:
      print ('{:032b}'.format(4294967296+int(256*I[i][j])))