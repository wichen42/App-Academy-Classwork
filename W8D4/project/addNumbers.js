const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, callback){

    if (numsLeft > 0){
            reader.question('What do you wanna add bro?\n', (response) => {
    
            let parsed = parseInt(response);
            sum += parsed;
            console.log(sum);// callback(sum = 3, 3-1 = 2, addNumbers)
            callBack(sum, numsLeft-1, addNumbers);
            
        })
    } else {
        console.log(sum)
        reader.close()
    }
    

} 

const callBack = function (sum, numsLeft, addNumbers) {
    // addNumbers(3,2, addNumbers)
    addNumbers(sum, numsLeft, addNumbers)
}

addNumbers(0, 3, callBack )