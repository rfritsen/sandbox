document.addEventListener('DOMContentLoaded', function() {
    const ctx = document.getElementById('myChart').getContext('2d');
    
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['', '2', '4', ''],  // X-axis labels
            datasets: [{
                label: 'Line between non-zero x coordinates',
                data: [null, 5, 8, null],  // Y-values corresponding to x-coordinates
                borderColor: 'blue',
                backgroundColor: 'rgba(0, 0, 255, 0.1)',
                pointBackgroundColor: 'red',
                pointRadius: 5,
                pointHoverRadius: 7,
                fill: false
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'X-axis'
                    },
                    ticks: {
                        stepSize: 1
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Y-axis'
                    },
                    beginAtZero: true
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Line Between Two Non-Zero X Coordinates'
                }
            }
        }
    });
});