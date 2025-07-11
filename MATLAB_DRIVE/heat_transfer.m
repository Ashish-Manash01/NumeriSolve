import matplotlib.pyplot as plt

thickness = [0, 0.5, 1, 2, 3, 4, 5]
heat_loss = [1044.72, 216.35, 114.29, 61.39, 43.19, 33.45, 26.93]

plt.plot(thickness, heat_loss)
plt.xlabel('Insulation Thickness (cm)')
plt.ylabel('Heat Loss (W/m)')
plt.title('Heat Loss vs. Insulation Thickness')
plt.grid(True)
plt.show()