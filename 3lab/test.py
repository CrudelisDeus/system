import numpy as np
import matplotlib.pyplot as plt

# трикутний сигнал

t_meas = 2 
t_start = 0 
dt = 0.001

n = (t_meas - t_start) / dt
t = np.arange(t_start, t_meas, dt)

amp = 1
f = 1.0  
phi = 0.0
y = amp * 2 * np.abs(2 * (t * f - np.floor(t * f + 0.5))) - 1 

plt.figure(figsize=(10, 6))
plt.plot(t, y)
plt.xlabel('t, s')
plt.ylabel('y(t)')
plt.title('Triangle Wave Signal')
plt.grid(True)

plt.savefig('output.png')
plt.close()
