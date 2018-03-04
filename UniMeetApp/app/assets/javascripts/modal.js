
        $(document).on('show.bs.modal','#myModal', function () {
            $('.modal .modal-dialog').attr('class', 'modal-dialog tada animated');
        });
        $(document).on('hide.bs.modal','#myModal', function () {
            $('.modal .modal-dialog').attr('class', 'modal-dialog lightSpeedOut animated');
        });
        $('#myModal').modal('show');