//Log a simple message, and add a new header to the body.


//Create a simple function and call it.
jsAddJs(@"
function addNumbs(numb1, numb2) {
  return numb1 + numb2;
}

var myNumb = addNumbs(1,1);
console.log(myNumb);
");

//Add some simple CSS to our document
jsAddCss(@"
body {
  background-color: green !important;
}
");

