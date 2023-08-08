Swal.fire({
    title: "Ketuntasan siswa berhasil di update",
    icon: "success",
    iconColor: 'white',
    customClass: {
        popup: 'colored-toast'
    },
    toast: true,
    position: 'top-right',
    showConfirmButton: false,
    timer: 5000,
    timerProgressBar: true
});

$("#tbl-superadmin").DataTable({
    serverSide: true,
    processing: true,
    ordering: false,
    ajax: {
        url: "{{ url('superadmin') }}"
    },
    drawCallback: function (res) {
        console.log(res.json);
    },
    columns: [{
        data: 'no'
    },
    {
        data: 'username'
    },
    {
        data: 'nama'
    },
    {
        data: 'settings'
    },
    ]
});