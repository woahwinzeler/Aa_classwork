function range(start, end) {
  let new_arr = [start];

  if (start === end) { //base case
    return new_arr;
  }
  return new_arr.concat(range(start+1, end));
}
console.log(range(1,10));

function sumRec(arr) {
  let sum = arr.shift();
  if (arr.length === 0) {
    return sum;
  }
  else {
    return sum + sumRec(arr);
  }
}
console.log(sumRec([1, 2, 3, 4, 5]));

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }
  else {
    return base * exponent(base, exp-1);
  }
}
console.log(exponent(2,3));

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }
  else if (exp % 2 === 0) {
    return exponent2(base, exp/2)**2;
  }
  else {
    return base * exponent2(base, (exp-1)/2)**2;
  }
}
console.log(exponent2(2,6));

function fibonacci(n){
  if (n === 0) {
    return [0];
  }
  else if (n === 1) {
    return [0, 1];
  }
  else {
    let list_2_n = fibonacci(n - 1);
    return list_2_n.concat([list_2_n[list_2_n.length - 1] + list_2_n[list_2_n.length - 2]]);
  }
}
console.log(fibonacci(8));

function deepDup(arr) {
  let new_arr = [];
  
  for (i=0; i < arr.length; i++) {
    if (arr[i] instanceof Array) {
      new_arr.push(deepDup(arr[i]));
    }
    else {
      new_arr.push(arr[i]);
    }
  }

  return new_arr;
}
console.log(deepDup([1, [2, [3, 4]]]));

function bsearch(arr, target) {
  let middle_index = Math.floor(arr.length/2);
  
  if (target === arr[middle_index]) {
    return middle_index;
  }
  else {
    let left = arr.slice(0,middle_index);
    let right = arr.slice(middle_index, arr.length);
    if (left.length < 1 || right.length < 1) {
      return -1;
    }
    if (target > arr[middle_index]) {
      console.log(middle_index);
      return middle_index + bsearch(right, target);
    }
    else {
      return bsearch(left, target);
    }
  }
};
console.log(bsearch([1,2,3,4,5],5))

function mergeSort(arr) {
  if (arr.length < 2) return arr;

  let middle_index = Math.floor(arr.length/2);

  let left = arr.slice(0, middle_index);
  let right = arr.slice(middle_index, arr.length);

  return merge_arrs(mergeSort(left), mergeSort(right));
}

// same function 
function merge_arrs(arr1, arr2) {

  let new_arr = [];

  while (arr1.length > 0 && arr2.length > 0) {
    if (arr1[0] > arr2[0]) {
      new_arr.push(arr2.shift());
    }
    else {
      new_arr.push(arr1.shift());
    }
  }

  return [...new_arr, ...arr1, ...arr2];
}

console.log(mergeSort([1, 4, 17, 7, 2, 3, 8, 2, 1]));