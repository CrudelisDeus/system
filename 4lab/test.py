import numpy as np
import matplotlib.pyplot as plt

t_meas = 2 
t_start = 0
dt = 0.001

n = (t_meas - t_start) / dt
t = np.arange(t_start, t_meas, dt)

amp = 1
f = 1.0  
phi = 0.0

y = amp * (t * f - np.floor(t * f))

noise_amplitude = 0.2
noise = noise_amplitude * np.random.randn(len(t))
y_noisy = y + noise

plt.figure(figsize=(10, 6))
plt.plot(t, y_noisy, label='Noisy Sawtooth Signal')
plt.xlabel('t, s')
plt.ylabel('y(t)')
plt.title('Noisy Sawtooth Wave Signal')
plt.grid(True)
plt.legend()

plt.savefig('output.png')
plt.close()
