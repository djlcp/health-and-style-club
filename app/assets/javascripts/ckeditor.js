CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "mini";
  // config.extraPlugins = 'videodetector';




  // ... rest of the original config.js  ...
}




// $(document).on('turbolinks:load', function() {
//   var auth_token = $('meta[name=csrf-token]').attr('content');
//   ClassicEditor
//   .create( document.querySelector( '#editor' ), {
//     height: '500px',
//     ckfinder: {
//       uploadUrl: '/attachments?authenticity_token=' + auth_token
//
//     }
//   } )
//   .then( editor => {
//     console.log( editor );
//   } )
//   .catch( error => {
//     console.error( error );
//   } );
// })
