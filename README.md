# IC Design Contest

This repository contains my design for the IC Design Contest. 
You can find more information about the contest [here](https://proj.moe.edu.tw/moeisoc/cl.aspx?n=4495).

Each folder corresponds to the respective year's competition and includes problem statements, RTL code, testbench, synthesis reports, and other relevant files.


| Year | Level | Name            | Clock Period | Highest Grade Standards                 | Result                                   | Grade |
|------|-------|-----------------|--------------|-----------------------------------------|------------------------------------------|-------|
| 2023 | Grad  | LASER           | 8 ns         | Area < 37000um²                         | Area : 30707um² <br> Cycle: 56574        |  A    |
| 2022 | Grad  | JAM             | 10 ns        | Area < 10000um²<br>Cycle < 430000       | Area : 8310um²  <br> Cycle: 362877       |  A    |
| 2021 | Univ  | Geofence        | 30 ns        | Area < 22000um²                         | Area : 16504um² <br> Cycle: 2505         |  A    |
| 2020 | Grad  | SME             | 20 ns        | Score = 100                             | Area : 17380um² <br> Cycle: 1822         |  A    |
| 2019 | Grad  | CONV            | 20 ns        | Area > 270000um²                        | Area : 41333um² <br> Time: 3563661 ns    |  S    |
| 2018 | Univ  | LCD_CTRL        | 20 ns        | ---                                     | Area : 70244um²                          |  A    |
| 2018 | Grad  | Huffman Coding  | 10 ns        | ---                                     | Area : 17584um² <br> Cycle: 156          |  A    |
| 2017 | Grad  | Distance Transform | 10 ns     | Area < 12500um²<br>Time < 1920000 ns    | Area : 4678um² <br> Time: 1459441 ns     |  A    |


## 2023 : LASER
The key objective for 2023 was to use iterative methods to find two circles that could cover the maximum number of target points.

- **Circuit Design:**
  - **4-Processor Version:**
    - Area: 23614.2 um²
    - Cycle Count: 112894
    - All patterns passed successfully.
  - **8-Processor Version:**
    - Area: 30707.7 um²
    - Cycle Count: 56574
    - All patterns passed successfully.

#### Grade A Standards for 2023:
- [x] All test patterns have successfully passed both gate-level and RTL simulations under a clock cycle of 8 ns.
- [x] Area < 37,000 um²

## 2022 : JAM (Jan Assignment Machine)
The focus for 2022 was on implementing the lexicographical permutation algorithm in a circuit.

- **Circuit Design:**
  - Area: 8310.5 um²
  - Cycle Count: 362877
  - All patterns passed successfully.

#### Grade A Standards for 2022:
- [x] All test patterns have successfully passed both gate-level and RTL simulations under a clock cycle of 10 ns.
- [x] Total simulation cycle count < 430,000 cycles.
- [x] Area < 10,000 um²

## 2021 : Geofence
The challenge for 2021 was to sort six coordinate points in a clockwise (or counterclockwise) order using the cross product of vectors, and then to use the cross product again to determine if an object is within the geofence formed by these points.

- **Circuit Design:**
  - Area: 16503.8 um²
  - Cycle Count: 2505
  - All patterns passed successfully.

#### Grade A Standards for 2021:
- [x] All test patterns have successfully passed both gate-level and RTL simulations under a clock cycle of 30 ns.
- [x] Area < 22,000 um²


## 2020 : SME(String Matching Engine)
The challenge for 2020 was to process a given string and multiple patterns, then to identify the locations of these patterns within the string. Special attention was required for four types of special symbols that necessitated unique handling.

- **Circuit Design:**
  - Area: 17379.7 um²
  - Cycle Count: 1822
  - All patterns passed successfully with a score of 100.

#### Grade A Standards for 2020:
- [x] All test patterns have successfully passed both gate-level and RTL simulations. Clock period = 20 ns(default).
- [x] Score = 100


## 2019 : CONV (Image Convolution Circuit Design)
The challenge for 2019 was to design a circuit for a convolution algorithm. The input data consisted of a single channel with 64x64 data points (4096 in total). The first layer involved convolution with two sets of 3x3 kernels and two sets of biases. The second layer implemented max pooling with a stride of 2, and the third layer involved flattening, where the data from max pooling (2x32x32) was interlaced in the output. The input data format was 20-bit, with the 4 most significant bits as a 4-bit integer and the 16 least significant bits as a 16-bit fraction.

- **Circuit Design:**
  - Area: 41333.4 um²
  - Run Time: 3563661 ns
  - All patterns, across all layers, successfully passed in both RTL and gate-level simulations under a clock period of 20 ns.

#### Grade S Standards for 2019:
- [x] All test patterns across all layers have successfully passed both gate-level and RTL simulations under any clock cycle.
- [x] Area > 270000 um²



## 2018 : LCD_CTRL (Image Display Control Circuit)
The challenge for 2018 was to design an image display control circuit capable of handling an 8x8 grayscale image. The circuit was required to process four pixels surrounding an operation point(op point), supporting functionalities such as op point movement, image rotation, and inversion.

- **Circuit Design:**
  - Area: 70243.5 um²
  - All patterns successfully passed in both RTL and gate-level simulations under a clock period of 20 ns.

#### Grade A Standards for 2018:
- [x] All test patterns have successfully passed both gate-level and RTL simulations under any clock cycle.


## 2018 : Huffman Coding Circuit
The challenge for 2018 was to design a circuit for Huffman coding. The input consisted of 100 pieces of data, each representing a grayscale value with six levels. The circuit was required to implement the Huffman coding algorithm based on these data points.

- **Circuit Design:**
  - Area: 17583.4 um²
  - All patterns successfully passed in both RTL and gate-level simulations under a clock period of 10 ns.

#### Grade A Standards for 2018:
- [x] All test patterns have successfully passed both gate-level and RTL simulations under a clock cycle of 10 ns.


## 2017 : Distance Transform Circuit
The challenge for 2017 was to design a circuit for Distance Transform. The circuit was to read 128x128 binary values from a testbench's ROM, implement the Distance Transform algorithm including a forward pass and a backward pass, and finally, return the results to the testbench's RAM.

- **Circuit Design:**
  - Area: 4678.0 um²
  - Time: 1,529,640,798 ps for TB1, 1,459,440,789 ps for TB2
  - All patterns successfully passed in both RTL and gate-level simulations under a clock period of 10 ns.

#### Grade A Standards for 2017:
- [x] All test patterns have successfully passed both gate-level and RTL simulations under a clock cycle of 10 ns.
- [x] Area < 12500 um²
- [x] Time < 1,920,000 ns


---
