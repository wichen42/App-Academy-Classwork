/* Constructors are first run when instantiating a new instance of a class.It is 
called when using the 'new' keyword. JS has a built in property for every object called
prototype. Creating a function on the class prototype will allow all subsquent classes
in the chain to inherit that function.
*/

/*
ES5 Syntax

function someClass() {

}
someClass.prototype.someFunction = function() {

}
*/

function Cat(name, owner) {
    this.name = name;
    this.owner = owner;
}

Cat.prototype.meow = function () {
    return `${this.name} says meow`;
}

const captainNemo = new Cat("Captain Nemo", "Spencer");

console.log(captainNemo.meow())

Cat.prototype.cuteStatement = function () {
    console.log(this)
    console.log('from cuteStatement')
    return `${this.owner} loves ${this.name}.`
}
/*
ES6 Syntax
class someClass {
    constructor() {
        //..Constuctor functionality
    }
    someFunction() {
        // 'Instance method' functionality
    }
}
*/

class Dog {
    constructor(name, owner) {
        this.name = name;
        this.owner = owner;
    }

    bark() {
        return `${this.name} says bark bark`
    }

}

const cerberus = new Dog("Cerberus", "Hades")
console.log(cerberus.bark())

