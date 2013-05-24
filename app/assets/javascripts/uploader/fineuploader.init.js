// $(function() { // нет конфликта с колбеком карты
  var up = $('#uploader').fineUploader({
    request: {
      endpoint: '/photos',
      params: {
        authenticity_token: $('meta[name=csrf-token]').attr('content'),
        spot_id: $('#uploader').data('spot-id')
      }
    },
    autoUpload: false,
    validation: {
      allowedExtensions: ['jpeg', 'jpg', 'png'],
      sizeLimit: 5242880 // 5mb
    },
    text: {
      uploadButton: 'Click or Drop'
    },
    showMessage: function(message) {
      $('#uploader').append('<div>'+ message +'</div>');
    }
  });

  $('#trigger').click(function() {
    up.fineUploader('uploadStoredFiles');
  });
// });


// this._options = {
//     debug: false,
//     button: null,
//     multiple: true,
//     maxConnections: 3,
//     disableCancelForFormUploads: false,
//     autoUpload: true,
//     request: {
//         endpoint: '/server/upload',
//         params: {},
//         paramsInBody: false,
//         customHeaders: {},
//         forceMultipart: false,
//         inputName: 'qqfile'
//     },
//     validation: {
//         allowedExtensions: [],
//         sizeLimit: 0,
//         minSizeLimit: 0,
//         stopOnFirstInvalidFile: true
//     },
//     callbacks: {
//         onSubmit: function(id, fileName){}, // return false to cancel submit
//         onComplete: function(id, fileName, responseJSON){},
//         onCancel: function(id, fileName){},
//         onUpload: function(id, fileName, xhr){},
//         onProgress: function(id, fileName, loaded, total){},
//         onError: function(id, fileName, reason) {},
//         onAutoRetry: function(id, fileName, attemptNumber) {},
//         onManualRetry: function(id, fileName) {},
//         onValidate: function(fileData) {} // return false to prevent upload
//     },
//     messages: {
//         typeError: "{file} has an invalid extension. Valid extension(s): {extensions}.",
//         sizeError: "{file} is too large, maximum file size is {sizeLimit}.",
//         minSizeError: "{file} is too small, minimum file size is {minSizeLimit}.",
//         emptyError: "{file} is empty, please select files again without it.",
//         noFilesError: "No files to upload.",
//         onLeave: "The files are being uploaded, if you leave now the upload will be cancelled."
//     },
//     retry: {
//         enableAuto: false,
//         maxAutoAttempts: 3,
//         autoAttemptDelay: 5,
//         preventRetryResponseProperty: 'preventRetry'
//     },
//     classes: {
//         buttonHover: 'qq-upload-button-hover',
//         buttonFocus: 'qq-upload-button-focus'
//     }
// };
