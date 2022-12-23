


    function confirmDelete(){
        return new Promise((resolve,reject)=>{
            Swal.fire({
                title: 'Chắc xóa hong pa ?',
                text: "Khum khôi phục được đâu nha pa",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xóa đi pa !'
                }).then((result) => {
                if (result.isConfirmed) {
                   resolve(true);
                }else{
                    reject(false);
                }
                });

        });
    }

    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr("content"),
        },
    });

    $(document).on('click','.btn-delete',function(e) {
        e.preventDefault();
        let id= $(this).data('id');
        confirmDelete().then(function(){
            $(`#form-delete${id}`).submit();
        }).catch();
    })
