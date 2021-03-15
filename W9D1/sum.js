function sum() {
  let args = Array.from(arguments);
  return args.reduce((acc, el) => acc + el);
}

const sum = function () {
  let args = Array.from(arguments);
  return args.reduce((acc, el) => acc + el);
};

function sum(...nums) {
  return nums.reduce((acc, el) => acc + el);
}
//let args = Array.from(arguments);

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);