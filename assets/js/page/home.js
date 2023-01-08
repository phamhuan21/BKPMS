"use strict";

var ctx = document.getElementById("project_chart").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'pie',
  data: {
    datasets: [{
      data: JSON.parse(project_status_values),
      backgroundColor: [
        '#fc544b',
        '#3abaf4',
        '#63ed7a',
      ],
    }],
    labels: JSON.parse(project_status),
  },
  options: {
    responsive: true,
    legend: {
      position: 'bottom',
    },
  }
});

var ctx = document.getElementById("task_chart").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: JSON.parse(task_status),
    datasets: [{
      data: JSON.parse(task_status_values),
      borderWidth: 2,
      backgroundColor: theme_color,
    }]
  },
  options: {
    legend: {
      display: false
    },
    scales: {
      yAxes: [{
        gridLines: {
          drawBorder: false,
          color: '#f2f2f2',
        },
        ticks: {
          beginAtZero: true,
          stepSize: 1
        }
      }],
      xAxes: [{
        gridLines: {
          display: false
        }
      }]
    },
  }
});
