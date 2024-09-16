import matplotlib.pyplot as plt
import numpy as np

# Set up the figure and axis
fig, ax = plt.subplots(figsize=(12, 6))
ax.set_facecolor('#FFFF00')

# Define reminders
reminders = [
    {'label': 'FIRST REMINDER', 'day': 1, 'color': 'red'},
    {'label': 'SECOND REMINDER', 'day': 10, 'color': 'blue'},
    {'label': 'THIRD REMINDER', 'day': 30, 'color': 'green'},
    {'label': 'FOURTH REMINDER', 'day': 60, 'color': 'orange'}
]

# Plot reminder lines
for i, reminder in enumerate(reminders):
    ax.plot([reminder['day'], reminder['day']], [90, 100], color=reminder['color'])
    if i < len(reminders) - 1:
        ax.plot([reminder['day'], reminders[i+1]['day']], [95, 95], color=reminder['color'])
    else:
        ax.plot([reminder['day'], 60], [90, 90], color=reminder['color'])
    ax.scatter(reminder['day'], 100, color=reminder['color'], s=30)
    ax.annotate(reminder['label'], (reminder['day'], 87), ha='center', fontsize=8)

# Plot forgetting curve
x = np.linspace(0, 60, 100)
y = 100 * np.exp(-0.05 * x)
ax.plot(x, y, '--', color='lightblue', label='PROJECTED FORGETTING CURVE')

# Set up axes
ax.set_xlim(0, 60)
ax.set_ylim(0, 110)
ax.set_xlabel('DAYS')
ax.set_ylabel('CHANCE OF REMEMBERING')
ax.set_title('MEMORIZATION', fontweight='bold', loc='left')

# Add 90% line
ax.axhline(y=90, color='black', linestyle='--', linewidth=0.5)
ax.text(1, 91, '[90%]', fontsize=8)

# Customize ticks
ax.set_xticks([0, 10, 20, 30, 40, 50, 60])
ax.set_yticks([])
ax.tick_params(axis='x', which='both', bottom=False)

# Add legend
ax.legend(loc='center', bbox_to_anchor=(0.5, 0.3))

# Remove top and right spines
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

# Show plot
plt.tight_layout()
plt.show()