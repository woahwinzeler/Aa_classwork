function sum(...args){
  let arr = args;
  let sum = 0;
  for(let i = 0; i < arr.length; i++){
    sum += arr[i];
  }
  return sum;
}; 

// function sum(){
//   let arr = Array.from(arguments);
//   let sum = 0;
//   for(let i = 0; i < arr.length; i++){
//     sum += arr[i];
//   }
//   return sum;
// }; 

console.log(sum(4,5,6,7));



