const readline = requre("readline")
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

rl.question("What do you think about Javascript?", 
(response) => {console.log(`Thank you for your feedback: ${response}`)
    rl.question("What do you really think about Javascript?"), 
    (truth) => {console.log(`Thank you for your honesty, you said: ${truth}`)
    rl.close()
}
});
