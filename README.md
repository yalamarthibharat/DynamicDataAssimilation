## Dynamic Data  Assimilation
Dynamic data assimilation is the assessment, combination and synthesis of observational data, scientific laws and mathematical models to determine the state of a complex physical system. It is a process by which observations of the actual system are incorporated into the model state of a numerical model of the actual system. Applications of data assimilation arise mostly in Weather forecasting, hydrology.

This project uses classical least squares approach to solve the dynamic data assimilation problem. Least squares implemented here are of two types:

 * Linear least squares
 * Non-linear leaast squares
 
Dynamic Data Assimilation problem is solved by implementing least squares as a deterministic process. Thus a dynamic data assimilation problem is converted into a least squares problem. The following computational methods are implemented in this project that can solve the least squares problem:
 * LU decomposition
 * QR decomposition
 * Successive Over Relaxation
 * Cholskey decomposition
 * Jacobi method
 * Singular Value Decomposition
 * Gradient 
 * Gauss Seidal
 
 This project also includes senstivity analysis of the output obtained.Senstivity analysis is the study of how the uncertainty in the output of a mathematical model or system can be apportioned to different sources of uncertainty in its inputs. Senstivity analysis is done by generating the inverse problem and computational techniques are used to solve the problem. This project impemented Forward Senstivity approach to solve the problem. It converts the problem into a least squares probem and solves it. Two types of analysis in FSM is implemented in this project namely:
 
  * First order FSM
  * Second order FSM

This project also implemented Lyapnov Index. It is a number using which we can say that the model has Deterministic chaos or not. Even when the system is deterministic, the model and the solution doesn't match to the output expected. This random behaviour for a deterministic system is known as Deterministic chaos. 
