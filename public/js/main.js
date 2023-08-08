const input = document.querySelectorAll("input");

// hapus is-invalid class di input jika input sedang di ketik
if (input != null) {
    input.forEach(function (el) {
        el.addEventListener("keyup", function (e) {
            if (e.target.classList.contains("is-invalid")) {
                e.target.classList.remove("is-invalid");
            }
        })
    });
}