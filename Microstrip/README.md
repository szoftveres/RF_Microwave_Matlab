# Building a 50ohm microstrip line

First we need to determine the Er of the PCB. We have a 1/4" copper tape and a 1.4mm thick PCB with a ~35um copper layer on it.:

![image 1](TraceThickness.jpg)
![image 2](SubstrateThickness.jpg)

After building a transmission line with this copper strip of known width on the PCB of known thickness, we need to measure its impedance; we can use the 1/4 wave impedance transformer method for this: the 50ohm terminated transmission line looks purely resistive on its other side at the frequency where it's behaving as a 1/4 wave impedance transformer, and the impedance it's showing (measured by VNA) is based on how it's reflecting the 50ohm termination, based on its own characteristic impedance.
The characteristic impedance of the transmission line can then be derived from the impedances at its two sides: Zt = sqrt(Z1 * Z2), where Z1 is the termination impedance (50ohm) and Z2 is the measured impedance (16ohm) at the VNA port.

![image 3](ThickWg.jpg)

The resulting characteristic impedance of the transmission line is 28.28ohms, which checks out as the trace is quite wide, and impedace gets lower with more capacitance (Z = sqrt(L/C)).

Next, we can use an online microstrip calculator tool to come up with an Er for the substrate, knowing that building a 1/4" wide trace on a 1.4mm thick piece of it will result in a 28.28ohm transmission line:


![image 4](Calc28ohm.jpg)

The resulting Er is around 4.3, which also checks out, knowing it's a typical number for FR4 substrates. We can use the same tool to come up with a width for the final 50ohm transmission line:


![image 5](Calc50ohm.jpg)

The resulting width is 2.72mm.

![image 6](ThinWg.jpg)

We can verify the result again using the 1/4 impedance transformer method. The new, thinner transmission line is showing impedances between 44ohm and 50ohm

