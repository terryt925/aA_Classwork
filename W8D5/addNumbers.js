const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
    return;
  }
  
  if (numsLeft > 0) {
    reader.question("Please enter a number: ", function (answer) {
      sum += parseInt(answer);
      console.log(`Sum: ${sum}`);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
    
  }
  
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
