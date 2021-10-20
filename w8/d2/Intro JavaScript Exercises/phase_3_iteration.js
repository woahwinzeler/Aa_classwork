Array.prototype.bubbleSort = function(cb){
  let sorted = false;
  
  while(!sorted){
    sorted = true; 
    for (i=0;i < this.length - 1; i++){
      if (cb(this[i], this[i+1])){
        sorted = false;

        //is this the cleanest way
        [this[i], this[i+1]] = [this[i+1], this[i]];

        // temp = this[i]; 
        // this[i] = this[i+1];
        // this[i+1] = temp; 


      };
    };
    
  };
  return this; 
}; 

console.log([1,4,17,7,2,3,8,2,1].bubbleSort(function (a,b) {
  if (a > b) {
  return true; 
 } 
 else{
  return false;
}})); 

String.prototype.substrings = function(){
  let new_arr = [];

  for(i=0; i < this.length; i++){
    for(j = i; j < this.length; j++){
      new_arr.push(this.slice(i,j+1)); 
    }
  }
  return new_arr;
}; 

console.log("String".substrings())
