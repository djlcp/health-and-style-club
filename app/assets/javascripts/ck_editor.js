$(document).on('turbolinks:load', function() {
  var auth_token = $('meta[name=csrf-token]').attr('content');
  ClassicEditor
  .create( document.querySelector( '#editor' ), {
    height: '500px',
    ckfinder: {
      uploadUrl: '/attachments?authenticity_token=' + auth_token

    }
  } )
  .then( editor => {
    console.log( editor );
  } )
  .catch( error => {
    console.error( error );
  } );
})
