#--------------------------------------------%
# Rohit Kharat
# Course Code: CSCI 5722
# Homework 3: Q6 Part A
# Instructor: Prof. Ioana Fleming
#--------------------------------------------%

def HW3_A(image):

    # Imports
    import cv2 
    import numpy as np
    import matplotlib.pyplot as plt

    # Reading image
    img = cv2.imread(image)

    # Rotate Image
    rot_img = cv2.rotate(img, cv2.ROTATE_90_COUNTERCLOCKWISE)

    # Translate Image
    warp_mat = np.float32([ [1,0,80], [0,1,120] ])
    trnslt_img = cv2.warpAffine(img, warp_mat, (img.shape[1], img.shape[0]))

    # Scale Image
    scale_img = cv2.resize(img, (0,0), fx=0.5, fy=0.5, interpolation= cv2.INTER_LINEAR)

    # Converting color image to grayscale image for Harris corner detection
    gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray_img = np.float32(gray_img)
    gray_rot_img = cv2.rotate(gray_img, cv2.ROTATE_90_COUNTERCLOCKWISE)
    gray_trnslt_img = cv2.warpAffine(gray_img, warp_mat, (gray_img.shape[1], gray_img.shape[0]))
    gray_scale_img = cv2.resize(gray_img, (0,0), fx=0.5, fy=0.5, interpolation= cv2.INTER_LINEAR)

    # Applying cornerHarris function
    dst = cv2.cornerHarris(gray_img,2,3,0.04)
    dst2 = cv2.cornerHarris(gray_rot_img,2,3,0.04)
    dst3 = cv2.cornerHarris(gray_trnslt_img,2,3,0.04)
    dst4 = cv2.cornerHarris(gray_scale_img,2,3,0.04)
    
    # Counting number of corner points
    corners = np.zeros(dst.shape)
    corners2 = np.zeros(dst2.shape)
    corners3 = np.zeros(dst3.shape)
    corners4 = np.zeros(dst4.shape)

    corners[dst > 0.01*dst.max()] = 255
    corners2[dst2 > 0.01*dst2.max()] = 255
    corners3[dst3 > 0.01*dst3.max()] = 255
    corners4[dst4 > 0.01*dst4.max()] = 255

    a = []
    a.append(np.argwhere(corners==255))
    a2 = []
    a2.append(np.argwhere(corners2==255))
    a3 = []
    a3.append(np.argwhere(corners3==255))
    a4 = []
    a4.append(np.argwhere(corners4==255))
    
    num_corners = len(a[0])
    num_corners2 = len(a2[0])
    num_corners3 = len(a3[0])
    num_corners4 = len(a4[0])
    
    # Dilation for making the corners not important
    dst = cv2.dilate(dst, None)
    dst2 = cv2.dilate(dst2, None)
    dst3 = cv2.dilate(dst3, None)
    dst4 = cv2.dilate(dst4, None)

    # Thresholding for an optimal value
    img[dst > 0.01 * dst.max()] = [0,0,255]
    rot_img[dst2 > 0.01 * dst2.max()] = [0,0,255]
    trnslt_img[dst3 > 0.01 * dst3.max()] = [0,0,255]
    scale_img[dst4 > 0.01 * dst4.max()] = [0,0,255]

    # Displaying images
    cv2.imshow('Default Image',img)
    cv2.imshow('Rotated Image',rot_img)
    cv2.imshow('Translated Image',trnslt_img)
    cv2.imshow('Scaled Image',scale_img)
    
    print("The number of Harris corners in the Normal image is:", num_corners)
    print("The number of Harris corners in the Rotated image is:", num_corners2)
    print("The number of Harris corners in the 1/2 Scaled image is:", num_corners3)
    print("The number of Harris corners in the Translated image is:", num_corners4)

    print('When the image is rotated, the harris corner algorithm detects the same number of corners as with the normal image.')
    print('The detected corners are less in case of translated image if the image is shifted beyond the size because there are less corners in the image.')
    print('For the 1/2 scaled image, because the detected corner points are too close together, the algorithm fails to dinstinguish between individual points.')
    
    if cv2.waitKey(0) & 0xff == 27:
        cv2.destroyAllWindows()
        
HW3_A('real_chessboard.jpg')