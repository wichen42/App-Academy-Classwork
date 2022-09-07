Array.prototype.bubbleSort = function() {
    let sorted = false;
    while(sorted === false) {
        sorted = true;
        this.forEach((ele, i) =>{
            if(ele > this[i+1]) {
                // this[i],this[i+1] = this[i+1],this[i];
                let bigger = ele;
                let smaller = this[i+1];
                this[i] = smaller;
                this[i+1] = bigger;
                sorted = false;
            }     
        })
    }
}

// let arr = [6,2,7,1,9,88];
// arr.bubbleSort();
// console.log(arr);


String.prototype.substrings = function(){
    results = [];
    for(let i=0;i<this.length;i++){
        for(let j=i+1;j<this.length;j++){
            let word = this.slice(i,j);
            results.push(word);
        }
    }
    return results;
}

str = "hello world";
console.log(str.substrings());