// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!

function curry(numberOfArgs){
  //private variable how many times our curry function 
  //private variable arguments we've recieved 
  let arr = []; 
  //closure 
  return function _currySum(num){
    //if not reached number of args
    //alter private variables 
    arr.push(num)
    if (arr.length !== numberOfArgs){
      return _currySum; 
    } else {
      //return sumThree invoked on our private array 
      //else call again 
      let total = 0; 
      for (let i = 0; i < arr.length; i++){
       total += arr[i];
      }
      return total;
    }
  }
};


// // let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// console.log(f1)
// f1 = f1(4); // [Function], we're returing undefined
// console.log(f1);
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30
// console.log(f1);


// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30

let sum = curry(4);
console.log(sum(5)(30)(20)(1));