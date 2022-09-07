Array.prototype.myEach = function (callback) {
    // let results = [];
    for(let i = 0; i < this.length; i++) {
        // results.push(callback(this[i]));
        callback(this[i]);
    }
    // return results;
}

let arr = [1,2,3];


// arr.forEach(element => console.log(element));
// arr.forEach(ele=>double(ele));

Array.prototype.myMap = function(callback){
    let results = [];
    this.myEach(function(ele){
        results.push(callback(ele));
    })
    return results;
}


function double(n){
    return 2*n;
}


// console.log(arr.myMap(ele => double(ele)))

Array.prototype.myReduce = function(callback,initialValue){
    let array = this;
    if(initialValue === undefined){
        initialValue = array[0];
        array = array.slice(1)
    }
    let acc = initialValue;
    array.myEach(function(ele){
        acc = callback(ele,acc);
    })
    return acc;
}



function callback(el, acc = 0){
    return el + acc;
}

let array = [1,2,3,4,5,6,7,8]

console.log( array.myReduce(callback,10) );






