# LFO Generator
## Project Description
This a digital design project built during my electrical engineering degree. The design is a variable waveshape LFO generator implemented on an FPGA using SystemVerilog, structured as a modular design with components for SPI communication to an external DAC, waveform generation using lookup tables, clock generation, and user input handling via rotary encoders. I developed testbenches to verify individual modules and used simulation 
tools to debug functionality and validate design behavior.

**Project Purpose:**

This is a guitar effect pedal accessory that generates a low frequency oscillator (LFO) control voltage (CV) signal to control external guitar pedal parameters.

**Example Use Case:**

I have a guitar overdrive pedal that has a ¼’’ external expression input. This input is intended to be connected to an external foot pedal that allows the player to control the filter cutoff parameter with their foot as opposed to turning the “FILTER” knob on the pedal. Using the same principal as the foot pedal, an LFO signal can be applied to this input to create a dynamic effect by continually modulating the filter cutoff.

## Modules

### lfoGenerator 
This is the **top-level module** used to instantiate the other modules, clocks, internal logic signals, and external I/O.

### dacInterface
This module implements the digital logic to interface to the **MAX5715 DAC**.

### enc2sel
This module implements parameter selection using an external rotarty encoder.

### enc2val
This module implements value changes to the selected parameter using  an external rotary encoder.

### freqGen
This module generates a clock for the waveform generator at the desired frequency. Frequency is measured in beats-per-minute (bpm). Available frequencies range from 30 bpm to 800 bpm in 5 bpm increments.

### waveGen
This module determines which data to send to the DAC based on the selected parameter values.

### lcdDisplay (File Omitted)
This module implements the digital logic to interface with the LCD display.

*Note: this module was completed by my project partner and has thus been omitted from this repository.*

## Testbenches
Testbenches have been included for the following modules:
- dacInterface
- freqGen
- waveGen
