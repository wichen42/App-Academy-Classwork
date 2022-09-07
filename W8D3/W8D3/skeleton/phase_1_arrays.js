
arr=[1,2,3,4,5,2,3,5,-2,-3,-4]
arrr=[1,2,3,-3,-2]

Array.prototype.uniq = function() {
    let results = [];
    // debugger
    // this.forEach(ele=>{
    //     if(!results.includes(ele)) {
    //         results.push(ele);
    //     }
    // })
    // console.log(this.length);
    for(let i = 0; i < this.length; i++){
        // debugger
        if(!results.includes(this[i])){
            results.push(this[i]);
        }
    }
    return results;
}

Array.prototype.twoSum = function() {
    let results = [];
    this.forEach((ele1,idx1)=>{
        this.forEach((ele2,idx2)=>{
            if((ele1+ele2 === 0)&&(ele1<ele2)){
                results.push([idx1,idx2])
            }
        })
    })
    console.log(results);
}

// arrr.twoSum()

Array.prototype.transpose = function() {
    let height = this.length;
    let width = this[0].length;
    
    let results = new Array(width)
    for (let k = 0; k < width; k++) {
        results[k] = new Array(height)
    }

    for(let i=0; i<height; i++) {
        for(let j = 0; j < width; j++) {
            results[j][i] = this[i][j];
        }
    }
    console.log(results);
}

arr = [[1,2,3],[4,5,6]]
arr.transpose()