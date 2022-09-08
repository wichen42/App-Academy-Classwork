// initial state of egg
let eggState = "IT'S RAW"

// steps to boiling an egg
function putEggInBoilingWater() {
    console.log(`1. Putting ${eggstate} egg in boiled water`);
    
    setTimeout(() => {
        eggState = "cooked";
        console.log(`2. Egg is ${eggState}`)
        takeEggOutOfPot()
        eatEgg()
    }, 3000)
}

function takeEggOutOfPot() {
    console.log(`3. Taking ${eggState} egg out of pot`);
}

function eatEgg() {
    console.log(`4. Eating ${eggState} egg!`);
}

console.log(putEggInBoilingWater());
console.log(takeEggOutOfPot());
console.log(eatEgg());