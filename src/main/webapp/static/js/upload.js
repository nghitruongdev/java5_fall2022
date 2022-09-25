// const imageUpload = document.getElementById('imageUpload');
// const preview = document.getElementById('imagePreview');
// let file;
// imageUpload.addEventListener('change', (event) =>{
//     //get files
//     const fileList = event.target.files;
//     if(fileList && fileList[0]){
//         file = fileList[0];
//     }
//     else return;
//
//     //read file
//     const reader = new FileReader();
//     reader.addEventListener('load', (event) => {
//         preview.src = event.target.result;
//         console.log(preview.classList);
//     })
//     reader.readAsDataURL(file);
// });

//Using JQuery
$(document).ready(function(){
    $('#imageUpload').change(function(event){
        readFile(event);
    })
});

const readFile = (input) => {
    let file;
    const fileList = input.target.files;
    if(fileList && fileList[0]){
        file = fileList[0];
        console.log(file);
    }else return;

    const reader = new FileReader();
    reader.onload = (event)=>{
        const preview = $('#imagePreview');
        preview.attr('src', event.target.result);
        preview.hide();
        preview.fadeIn(300);
        preview.attr('title', file.name);
        new bootstrap.Tooltip(preview);
    };
    reader.readAsDataURL(file);
};