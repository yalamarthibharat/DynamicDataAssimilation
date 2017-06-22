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
