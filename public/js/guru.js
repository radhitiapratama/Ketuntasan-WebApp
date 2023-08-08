$(document).on('select2:open', () => {
    document.querySelector('.select2-search__field').focus();
});

document.addEventListener("click", function (e) {
    if (e.target.classList.contains("btn-delete-input")) {
        e.target.parentElement.remove();
    }
});

let numSelect2 = 1;
const formGroupWrapper = $(".form-group-wrapper");

// fungsin add mapel element (file guru/add.blade.php)
function addMapelElement() {
    // ambil option element
    const opt = $(".dummy-opt").html();

    // el
    const el = `
    <div class="form-group input-wrapper ">
        <label for="mapel_custom_add_${numSelect2}">Mapel yang di ajar</label>
        <select name="add_mapel_id[]" id="mapel_custom_add_${numSelect2}" class="form-control">
            ${opt}        
        </select>
        <button type="button" class="btn-delete-input">
            X
        </button>
    </div>`;

    formGroupWrapper.append(el);

    $(`#mapel_custom_add_${numSelect2}`).select2({
        theme: "bootstrap4",
        width: "100%",
        placeholder: "Pilih.."
    })

    numSelect2++;
}

$(".btn-add").click(function () {
    addMapelElement();
});

if ($("#username_select2") == true) {
    $("#username_select2").select2({
        theme: "bootstrap4",
        placeholder: "Pilih...",
        with: "100%"
    });
}

// data mapel yg di ajar guru
const mapel_id = document.querySelectorAll(".mapel_id");
if (mapel_id) {
    for (let i = 1; i <= mapel_id.length; i++) {
        $(`#mapel_id_${i}`).select2({
            theme: "bootstrap4",
            width: "100%",
        })
    }
}

// delete
const checkAllCheckboxes = document.querySelector("#check_all");
if (checkAllCheckboxes) {
    checkAllCheckboxes.addEventListener("click", function (e) {
        const checkboxes = document.querySelectorAll("#del_mapel_id");
        if (e.target.checked == true) {
            checkboxes.forEach(function (el) {
                el.checked = true;
            });
        } else {
            checkboxes.forEach(function (el) {
                el.checked = false;
            });
        }
    });
}

const formDelete = document.querySelector("#form-delete");
const btnDelMapel = document.querySelector("#btn-delete");
if (formDelete && btnDelMapel && checkAllCheckboxes) {
    btnDelMapel.addEventListener("click", function () {
    });
}