# 2D 3R Manipulator Control Project

## Project Overview

This project aims to implement dynamic control of a 2D robotic manipulator with three revolute joints (3R) using the "Computed Torque Control" strategy. The manipulator can be commanded to move to specific points within its workspace.

## Instructions

To operate the robotic arm, follow these steps:

1. Launch the program named **`main.m`**.
2. Select a point within the designated workspace, which is indicated in **red**.

## Example Figures

Below are example figures illustrating the performance of the manipulator. These figures are provided in PDF format.

- [Figure 1: Initial State](fig0.pdf)
- [Figure 3: Final State](fig1.pdf)

### Displayed Data

The displayed data in the figures includes:

- **Distance Error**: The deviation between the desired position and the actual position of the end effector.
- **Orientation Error**: The difference between the desired orientation and the actual orientation of the end effector.

## Additional Commands

Below are additional commands to run directly in the terminal to obtain the curves of the different variables:

```matlab
figure_torque(time_array, tau_1_array, tau_2_array, tau_3_array)
figure_qdotdot(time_array, qdotdot1_array, qdotdot2_array, qdotdot3_array)
figure_qdot(time_array, qdot1_array, qdot2_array, qdot3_array)
```

See for example:

- [Figure 1: Torque T(t)](Torque.pdf)
- [Figure 3: Joint velocities $\dot{q}(t)$](Joint_Velocities.pdf)
