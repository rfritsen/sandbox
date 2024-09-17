import React from 'react';

const MemorizationCurveChart = () => {
  const reminders = [
    { label: 'FIRST REMINDER', day: 1, color: 'red' },
    { label: 'SECOND REMINDER', day: 10, color: 'blue' },
    { label: 'THIRD REMINDER', day: 30, color: 'green' },
    { label: 'FOURTH REMINDER', day: 60, color: 'orange' },
  ];

  const forgettingCurve = [
    { x: 0, y: 100 },
    { x: 10, y: 60 },
    { x: 20, y: 40 },
    { x: 30, y: 30 },
    { x: 60, y: 20 },
  ];

  const reminderLines = reminders.map((reminder, index) => {
    const nextY = index < reminders.length - 1 ? 95 : 90;
    return `M${reminder.day * 5},100 L${reminder.day * 5},${nextY} L${reminders[index + 1]?.day * 5 || 300},${nextY}`;
  });

  return (
    <svg viewBox="0 0 300 150" style={{ backgroundColor: '#FFFF00' }}>
      {/* Y-axis */}
      <line x1="0" y1="0" x2="0" y2="100" stroke="black" strokeWidth="1" />
      <text x="-30" y="50" transform="rotate(-90, -30, 50)">CHANCE OF REMEMBERING</text>
      
      {/* X-axis */}
      <line x1="0" y1="100" x2="300" y2="100" stroke="black" strokeWidth="1" />
      <text x="150" y="120" textAnchor="middle">DAYS</text>
      
      {/* Forgetting curve */}
      <path
        d={`M${forgettingCurve.map(point => `${point.x * 5},${100 - point.y}`).join(' L')}`}
        stroke="lightblue"
        strokeWidth="2"
        fill="none"
        strokeDasharray="5,5"
      />
      
      {/* Reminder lines */}
      {reminderLines.map((d, i) => (
        <path key={i} d={d} stroke={reminders[i].color} strokeWidth="2" fill="none" />
      ))}
      
      {/* Reminder points and labels */}
      {reminders.map((reminder, i) => (
        <React.Fragment key={i}>
          <circle cx={reminder.day * 5} cy="100" r="3" fill={reminder.color} />
          <text x={reminder.day * 5} y="85" textAnchor="middle" fontSize="8">
            {reminder.label}
          </text>
        </React.Fragment>
      ))}
      
      {/* Memorization title */}
      <text x="10" y="15" fontWeight="bold">MEMORIZATION</text>
      
      {/* 90% line */}
      <line x1="0" y1="10" x2="300" y2="10" stroke="black" strokeWidth="1" strokeDasharray="5,5" />
      <text x="15" y="15" fontSize="8">[90%]</text>
      
      {/* Projected forgetting curve text */}
      <text x="150" y="80" textAnchor="middle" fontSize="8">PROJECTED FORGETTING CURVE</text>
    </svg>
  );
};

export default MemorizationCurveChart;