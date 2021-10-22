// Function.prototype.inherits = function(parentClass) {
//     function Surrogate() {}
//     Surrogate.prototype = parentClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }

Function.prototype.inherits = function(parentClass) {
    this.prototype = Object.create(parentClass.prototype)
    this.prototype.constructor = this
}

function MovingObject() { }

MovingObject.prototype.sound = function() {
    console.log("Wooooooosh!");
}

function Ship() { }
Ship.inherits(MovingObject);

Ship.prototype.speed = function() {
    console.log("this ship is slow 5 mph!")
}

function Asteroid() { }
Asteroid.inherits(MovingObject);

Asteroid.prototype.velocity = function() {
    console.log("this is moving at 1000 mph!")
}

let blackPearl = new Ship();
blackPearl.sound();
blackPearl.speed();

let rock = new Asteroid();
rock.velocity();
rock.sound();
rock.speed();