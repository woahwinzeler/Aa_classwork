
const makeIdentity = (arr) => {
    let object = {};
    for(let i = 0; i < arr.length; i++){
        object[i] = arr[i]
    }
    return object
}

export default makeIdentity