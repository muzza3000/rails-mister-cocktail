import Dropzone from 'dropzone';

console.log("Hello dropzone-components.js!");

Dropzone.autoDiscover = false;
let myForm = document.getElementById("my-awesome-dropzone");
console.log(myForm);
new Dropzone(myForm, {
  paramName: "cocktail[photo]",
  maxFilesize: 1,
  dictDefaultMessage: 'Upload your picture by dragging the image here',
  // addedfile: (file) => {
  //   console.log(file)
  //   document.querySelector('input[type="file"][name="cocktail[photo]"]').filename = file
  // }
});