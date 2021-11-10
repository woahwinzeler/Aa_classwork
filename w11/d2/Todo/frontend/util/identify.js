
const makeIdentity = (arr) => {
    let object = {};
    for(let i = 0; i < arr.length; i++){
        let ele = arr[i];
        object[ele.id] = ele
    }
    return object
}

export default makeIdentity