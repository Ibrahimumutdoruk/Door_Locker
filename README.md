#### Project Overview

The objective of this project is to design and implement a door locker system on an FPGA board, utilizing a unique password derived from a student ID number. The student ID number, given in hexadecimal format, will be converted to binary and used as the password to control access.

#### System Components and Operation

1.  **Password Definition:**
    
    -   The password will be derived from the  ID number in hexadecimal format.
    -   This hexadecimal number will be converted to its binary equivalent to define the password PPP.
2.  **User Interaction:**
    
    -   The user will input a password using 12 switches (SW0 to SW11) to set the binary value (e.g., `0010 0011 0100`).
    -   The user will then press the button BTNR (Enable) to store the entered data into a register.
    -   Next, the user will press the button BTNL (Start) to initiate the password check process by sending the stored data to the state machine.
3.  **State Machine Operation:**
    
    -   The stored data is sent to the state machine serially, one bit per clock cycle.
    -   The system will utilize 12 LEDs (LD0 to LD11) to indicate the correctness of each entered bit in real-time.
        -   If the first bit is correct, LD0 will turn on in the first clock cycle.
        -   If the second bit is correct, LD1 will turn on in the second clock cycle (LD0 remains on).
        -   If a bit is incorrect, the state machine will stay in the same state, and the wrong password indicator (LD14) will turn on.
    -   The process continues until all bits are verified.
4.  **Output and Indicators:**
    
    -   If the entered password matches the predefined password (derived from the student ID), all 12 LEDs (LD0 to LD11) will be on, indicating the door is unlocked.
    -   If any bit is incorrect, the wrong password indicator (LD14) will light up, and the user must reset the system.
5.  **Reset Mechanism:**
    
    -   A reset button will allow the user to reset the state machine to its initial state and clear the register content.
    -   Upon pressing the reset button, all LEDs will turn off, and the system will be ready for a new password entry.
    -   Parallel to serial shift register is used.
Shematic
      ![Screenshot 2024-06-15 125449](https://github.com/Ibrahimumutdoruk/Door_Locker/assets/91209884/32affdb8-aef7-4835-8ddd-72542625f5d0)

      


