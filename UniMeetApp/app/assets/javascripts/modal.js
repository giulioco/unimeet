
$('#myModal').on('show.bs.modal', function () {
      $('.modal .modal-dialog').attr('class', 'modal-dialog tada animated');
});
$('#myModal').on('hide.bs.modal', function () {
      $('.modal .modal-dialog').attr('class', 'modal-dialog lightSpeedOut animated');
});