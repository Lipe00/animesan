// VEREFICAÇÃO
const inps = document.querySelectorAll('.inptxt')

inps.forEach((e)=>{
    e.addEventListener("keypress",(e)=>{
        if(check(e)){
            e.preventDefault()
        }
    })
})

function check(e){
    const char = String.fromCharCode(e.keyCode)
    const per = '[()<>{}]'

    if(char.match(per)){
        return true
    }
}

// NAVBAR: SEARCH
const searchBtn = document.querySelector(".search-btn");
const cancelBtn = document.querySelector(".cancel-btn");
const searchBox = document.querySelector(".search-box");
const searchInp = document.querySelector(".sinput");

searchBtn.onclick = () =>{
    searchBox.classList.add("active");
    searchInp.classList.add("active");
    cancelBtn.classList.add("active");
    searchBtn.classList.add("active");
    searchInp.focus();
    setTimeout(limparsearch);
}

cancelBtn.onclick = () =>{
    searchBox.classList.remove("active");
    searchInp.classList.remove("active");
    cancelBtn.classList.remove("active");
    searchBtn.classList.remove("active");
    setTimeout(limparsearch);

}
function limparsearch(){
    searchInp.value = "";
}

// CELL NAVBAR
const rbt = document.querySelector("#rbt")
const rmn = document.querySelector("#rmn")
const rrr = document.querySelector("#rrr")
const body = document.querySelector("body")
const scrolla = document.querySelector(".scroll")

rbt.onclick = ()=>{
    rmn.classList.remove("desativado");
    body.classList.add("no-scroll");
    scrolla.classList.add("no-scroll");
}
rrr.onclick = ()=>{
    rmn.classList.add("desativado");
    body.classList.remove("no-scroll");
    scrolla.classList.remove("no-scroll");
}