document.addEventListener("DOMContentLoaded", () => {
    const canvasEl = document.getElementById('canvas');

    canvasEl.width = 500;
    canvasEl.height = 500;
    
    const context = canvasEl.getContext('2d'); 
    
    context.fillStyle = 'black';
    context.fillRect(0,0,500,500);

    context.beginPath(); // instructions to draw line
    context.arc(250, 250, 30, 0, 2 * Math.PI, true);
    context.strokeStyle = 'white';
    context.lineWidth = 10;
    context.stroke(); // draw line
    context.fillStyle = 'red';
    context.fill();
}) 

