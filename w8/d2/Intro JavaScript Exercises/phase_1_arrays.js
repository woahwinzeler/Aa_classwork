Array.prototype.uniq = function () {

  let new_arr = [];
  
  for (i=0; i < this.length; i++) {

    if (!(new_arr.includes(this[i]))) {
      
      new_arr.push(this[i]);

    };

  };
  return new_arr;
};

console.log([1,3,1,2,2,3,2,5,3].uniq());

Array.prototype.twoSum = function(){
  //nested for loop
  //outer 0 to length - 2 
  //inner loop from i to length - 1

  let pairs = [];

  for (i=0; i < this.length - 1; i++){
    for(j=i; j < this.length; j++){
      if ((this[i] + this[j]) === 0){
        pairs.push([this[i], this[j]]); 
      }
    }
  }

  return pairs; 
};

console.log([1,-1, 5, 7, -5, -7].twoSum())

Array.prototype.transpose = function(){

  //setting our new heights and widths
  // let height = this[0].length 
  // let width = this.length 

  let new_transpose = [];

  //nested loop
  for (i=0; i < this[0].length; i++){
    for(j=0; j < this.length; j++){
      if (j === 0){
        new_transpose.push([this[j][i]]);
      }
      else {
        new_transpose[i].push(this[j][i]); 
      };
    };
  };
  return new_transpose; 
};

console.log([[1,2,3], [4,5,6]].transpose());