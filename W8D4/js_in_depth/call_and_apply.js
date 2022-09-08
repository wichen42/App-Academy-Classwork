function Dog(name) {
    this.name = name;
}

Dog.prototype.sniffPerson = function (person1, person2) {
    let msg = `${this.name} is sniffing ${person1}`;

    if (person2) {
        msg += ` and ${person2}`;
    }

    console.log(msg);
}

const clifford = new Dog("Clifford");

clifford.sniffPerson("Peepo", "Peep");