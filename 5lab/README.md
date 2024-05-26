# 5 lab

**Індвідуальне завдання**: Sin, Cos, Square wave

**Комментарі до коду**
```python
# 2 Визначення параметрів вимірювання
t_meas = 2  # s
t_start = 0  # s
dt = 0.001


# 3 Генерація часових відліків:
t = np.arange(t_start, t_meas, dt)


# 4 Визначення параметрів сигналу:
amp = 1
f = 1.0 


# 5 Генерація сигналів:
sin_wave = amp * np.sin(2 * np.pi * f * t)
cos_wave = amp * np.cos(2 * np.pi * f * t)
square_wave = amp * np.sign(np.sin(2 * np.pi * f * t))

# 7 Додавання шуму до сигналів:
noise_amplitude = 0.1
sin_wave_noisy = sin_wave + noise_amplitude * np.random.randn(len(t))
cos_wave_noisy = cos_wave + noise_amplitude * np.random.randn(len(t))
square_wave_noisy = square_wave + noise_amplitude * np.random.randn(len(t))

# 8 Створення графіків
plt.figure(figsize=(10, 6))
plt.plot(t, sin_wave_noisy, label='Sin Wave')
plt.plot(t, cos_wave_noisy, label='Cos Wave')
plt.plot(t, square_wave_noisy, label='Square Wave')
plt.xlabel('t, s')
plt.ylabel('Amplitude')
plt.title('Sin, Cos, and Square Waves with Noise')
plt.legend()
plt.grid(True)
```