document.addEventListener('DOMContentLoaded', function() {
    const ctx = document.getElementById('myChart').getContext('2d');

    // Function to generate logarithmic curve data
    function generateLogarithmicCurve(x1, y1, x2, y2, numPoints) {
        const points = [];
        const a = (y2 - y1) / (Math.log(x2) - Math.log(x1));
        const b = y1 - a * Math.log(x1);

        for (let i = 0; i < numPoints; i++) {
            const x = x1 + (i / (numPoints - 1)) * (x2 - x1);
            const y = a * Math.log(x) + b;
            points.push({x, y});
        }
        return points;
    }

    // Generate curve data
    const curveData = generateLogarithmicCurve(2, 5, 4, 8, 100);

    new Chart(ctx, {
        type: 'line',
        data: {
            datasets: [{
                label: 'Logarithmic curve between non-zero x coordinates',
                data: curveData,
                borderColor: 'blue',
                backgroundColor: 'rgba(0, 0, 255, 0.1)',
                pointRadius: 0,
                tension: 0
            }, {
                label: 'Original Points',
                data: [{x: 2, y: 5}, {x: 4, y: 8}],
                borderColor: 'red',
                backgroundColor: 'red',
                pointRadius: 5,
                pointHoverRadius: 7,
                showLine: false
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    type: 'linear',
                    title: {
                        display: true,
                        text: 'X-axis'
                    },
                    min: 1.5,
                    max: 4.5
                },
                y: {
                    title: {
                        display: true,
                        text: 'Y-axis'
                    },
                    beginAtZero: false
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Logarithmic Curve Between Two Non-Zero X Coordinates'
                }
            }
        }
    });
});