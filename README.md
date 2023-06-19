# Computer-Aided-Design-for-VLSI-Design

## HW1
Consider a system consisting of 3 input ports and 3 output ports as shown below.

![image](https://github.com/cherry900606/Computer-Aided-Design-for-VLSI-Design/assets/61570297/2a3e36d5-eb26-498d-b9f4-909d631c0da7)


Each input port represents a 4-bit positive binary number. Each output port contains only 1 bit. Output ports will indicate which input port has minimum value. The 
functions of the system are shown below.

|Input Ports| Output Ports|
|-----------|-----------|
|There is only one minimum value. A=min{A, B, C}|A_min=1; B_min=C_min=0;|
|There is only one minimum value. B=min{A, B, C}|B_min=1; A_min=C_min=0;|
|There is only one minimum value. C=min{A, B, C}|C_min=1; A_min=B_min=0;|
|Other cases| A_min= B_min= C_min=0;|

Write a VHDL code to implement the system using Quartus II.

## HW2
Consider a shift register based system shown below. 

![image](https://github.com/cherry900606/Computer-Aided-Design-for-VLSI-Design/assets/61570297/65585809-df6b-4f01-9b56-b6684f55ca96)

It contains two input ports (clk and D_in) and one output port (B). The shift register in the circuit consists of three stages. The circuit with entity name My_ckt_1 is the circuit developed in the first homework.

Write a VHDL code to implement the system using Quartus II.

## HW3
The goal of this homework is to design a traffic light control circuit. As shown in Figure 1, the circuit consists of a controller and a counter.

![image](https://github.com/cherry900606/Computer-Aided-Design-for-VLSI-Design/assets/61570297/bfae2d59-3fcb-4d92-b59c-0e0c37b2ea3b)

**Figure 1. The architecture of the traffic light control circuit.**

The ASM chart of the controller is shown in Figure 2. The controller has six states: green1, green2, red1, red2, yellow1 and yellow2. When the controller in green1 state, it turns on g_light (g_light=1) for the green light, and resets the counter (reset=1). It then enters green2 state. Note that, in green2 state, the counter is activated (enable=1). 

![image](https://github.com/cherry900606/Computer-Aided-Design-for-VLSI-Design/assets/61570297/61ff0f30-22d5-4a4c-a5d1-203bed896a48)

**Figure 2. The ASM chart of the controller.**

The counter performs up counting operations. It will be reset as 0 when reset=1. When reset=0 and enable=1, the counter will increase its counting value by 1 on the rising edge of the clock. When counting value reaches the maximum value, the complete=1. 

After the counting operation is completed (complete=1), the controller then enters yellow1 state. In the yellow1 state, the controller turns on y_light (y_light=1) for yellow light, and then enters to red1 state.

The states red1 and red2 correspond to the operations for red light. These operations are the same as those for the green light. After the completion of operations for red light, the controller turns on yellow light again in the state yellow2. After that, the controller goes back to green1 state.

Implement the traffic light controller by VHDL.

## HW4

Implement and simulate the 64-bit random number generator (RNG) circuit at RTL level introduced in Chapter 8 using Modelsim. In the simulation, please DO NOT use 
the same initial seed value shown in Chapter 8 for the observation of output. The implementation of 1D cell array with 64 cells is required.

**Optional:**

Extra credits (40 points) will be granted if you have successfully applied the circuit for the applications such as lottery number generation.

In our system, the lottery number is between 0 to 20. We need to generate 3 lottery numbers. As shown in the following figure, the electronic lottery generation circuit is based on 64-bit RNG and a modulo-by-21 circuit.

![image](https://github.com/cherry900606/Computer-Aided-Design-for-VLSI-Design/assets/61570297/023fbc18-7bc8-4a9d-948f-e93341b78969)

You can implement the modulo circuit by modulo operator (i.e., mod) in VHDL.
