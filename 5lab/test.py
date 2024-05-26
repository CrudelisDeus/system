import numpy as np
import matplotlib.pyplot as plt

t_meas = 5 
t_start = 0 
dt = 0.01

t = np.arange(t_start, t_meas, dt)

amp = 1
f = 1.0 

sin_wave = amp * np.sin(2 * np.pi * f * t)
cos_wave = amp * np.cos(2 * np.pi * f * t)
square_wave = amp * np.sign(np.sin(2 * np.pi * f * t))

noise_amplitude = 0.1
sin_wave_noisy = sin_wave + noise_amplitude * np.random.randn(len(t))
cos_wave_noisy = cos_wave + noise_amplitude * np.random.randn(len(t))
square_wave_noisy = square_wave + noise_amplitude * np.random.randn(len(t))

plt.figure(figsize=(10, 6))
plt.plot(t, sin_wave_noisy, label='Sin Wave')
plt.plot(t, cos_wave_noisy, label='Cos Wave')
plt.plot(t, square_wave_noisy, label='Square Wave')
plt.xlabel('t, s')
plt.ylabel('Amplitude')
plt.title('Sin, Cos, and Square Waves with Noise')
plt.legend()
plt.grid(True)

plt.tight_layout()
plt.savefig('output.png')
plt.close()
