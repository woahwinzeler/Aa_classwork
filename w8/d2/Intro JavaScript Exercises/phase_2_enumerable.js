Array.prototype.myEach = function(cb) {// cb = callback
  for (i = 0; i < this.length; i++) {
    cb(this[i]);
  }
  return this;
};

console.log([1,2,3].myEach(el => console.log(el * 2)));


Array.prototype.myMap = function(cb) {// cb = callback
  let new_arr = [];
  for (i = 0; i < this.length; i++) {
    new_arr.push(cb(this[i]));
  }
  return new_arr;
};

console.log([1,2,3].myMap(el => el * 5));

Array.prototype.myReduce = function (cb, initial_value) {
  initial_value = initial_value || 0;
  for (i=0; i < this.length; i++) {
    // initial_value += cb(this[i]);
    initial_value = cb(initial_value, this[i]);
  }
  return initial_value;
};
console.log([1, 2, 3].myReduce(function (acc, el) {
  return acc + el;
}));