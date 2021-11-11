const array_combiner = (arr1, arr2) => {
    if(arr1.length !== arr2.length){
        throw new Error("Arrays must be of the same length")
    } else {
        let newArr = [];
        for(let i = 0; i < arr1.length; i++){
            newArr.push(arr1[i]);
            newArr.push(arr2[i]);
        }
        return newArr
    }
    
}

export default array_combiner