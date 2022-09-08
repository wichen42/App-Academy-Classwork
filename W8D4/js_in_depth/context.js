class Dog {
    constructor(name, owner) {
        this.name = name;
        this.owner = owner;
    }

    bark() {
        return `${this.name} says bark bark`
    }

    hungry() {
        return `${this.owner} please feed me some treats`
    }

}

const cerberus = new Dog("Cerberus", "Hades")


function timesDo(num, cb) {
    for(let i = 0; i < num; i++) {
        console.log(cb());
    }
}

// how we lose context with method style invocation. this will
// not be cerberus, it will be undefined.

// let detachedBark = cerberus.bark
// console.log(timesDo(3, detachedBark));

// keeps context
function betterDetachedBark() {
    return cerberus.bark();
}

console.log(timesDo(betterDetachedBark()));

// keeps context with bind i.e. passing in the context

let detachedBark = cerberus.bark
const boundCerberus = detachedBark.bind(cerberus);
console.log(timesDo(4, boundCerberus));


