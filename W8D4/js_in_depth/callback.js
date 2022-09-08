// Callback Demo

// add
function add(x,y) {
    return x + y;
}

// subtract
function subtract(x,y) {
    return x - y;
}

// multiply
function multiply(x,y) {
    return x * y;
}

// Square Root
function sqrt(x) {
    return Math.sqrt(x);
}

// callback is just a function that is passed into another function's arguments 
// as a parameter. It is not invoked, until the method it is in is called.
function calculator(operationCallback, num1, num2) {
    return operationCallback(num1, num2);
}

console.log(calculator(add, 2, 2));
console.log(calculator(subtract, 6, 2));
console.log(calculator(add, 2, 2));
console.log(calculator(sqrt, 16));

function sumTwoOperations(cb1, cb2, num1, num2) {
    //return (cb1(num1, num2) + cb2(num1, num2));
    let res1 = cb1(num1, num2);
    let res2 = cb2(num1, num2);
    return res1 + res2;
}

console.log(sumTwoOperations(add, multiply, 1, 2))



