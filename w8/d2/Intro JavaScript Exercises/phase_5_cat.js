function Cat(name, owner) {
    this.name = name;
    this.owner = owner; 
}

Cat.prototype.cuteStatement = function () {
    return `${this.owner} loves ${this.name}.`
}

let isabelle = new Cat('John', 'Isabelle');
console.log(isabelle.cuteStatement());

Cat.prototype.cuteStatement = function () {
    return `Everyone loves ${this.name}.`
}

let pearl = new Cat('Pearl', 'John');
console.log(pearl.cuteStatement());

Cat.prototype.meow = function () {
    return "meow"
}

console.log(pearl.meow())
console.log(isabelle.meow())


isabelle.meow = function () {
    return "woof"
}

console.log(isabelle.meow())

