const img = document.querySelectorAll("img");
img.forEach(function (e) {
    e.setAttribute('draggable', false);
})

const inputPass = document.querySelector(".input-pass");
const showPass = document.querySelector("#show-pass");
showPass.addEventListener("click", function (e) {
    if (inputPass.getAttribute("type") == "text") {
        inputPass.setAttribute("type", "password");
        e.target.classList.remove("fa-eye-slash");
        e.target.classList.add("fa-eye")
    } else {
        inputPass.setAttribute("type", "text");
        e.target.classList.remove("fa-eye")
        e.target.classList.add("fa-eye-slash")
    }
});