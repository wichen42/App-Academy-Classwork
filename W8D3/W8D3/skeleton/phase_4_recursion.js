function range(start,end){
    if(start === end){
        return [end];
    }

    let array = range(start+1,end);
    // console.log(array[0]-1)
    array.unshift(array[0]-1);//[5]
    // console.log(array);
    return array;
}

console.log(range(3,5))
// range(4,5)