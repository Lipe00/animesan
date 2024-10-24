const bodya = document.getElementById("body");

const denun = document.querySelectorAll(".denun");
const pupd = document.getElementById("pupd");
const cancelbtnd = document.getElementById("cancelbtnd");

const avali = document.querySelectorAll(".inpc");
const pupa = document.getElementById("pupa");
const cancelbtna = document.getElementById("cancelbtna");

const sele = document.getElementById("sele");
const arrow = document.getElementById("arrow");
const options = document.getElementById("options");
const option = document.querySelectorAll(".option")
const seleb = document.getElementById("seleb")
const t = document.querySelector(".t")

const heart = document.querySelector("#heart")
const formf = document.querySelector("#formf")

const like = document.querySelectorAll(".like")
const forml = document.querySelector("#forml")

// CUSTOM SELECT
seleb.onclick = ()=>{
    arrow.classList.add("rotate");
    options.classList.remove("none");
    t.classList.add("tw")
}
option.forEach((e)=> {
    e.addEventListener("click", ()=>{
        sele.innerHTML = e.querySelector("label").innerHTML
        arrow.classList.remove("rotate");
        options.classList.add("none");
    })
});

// POP-UP: AVALIAR

avali.forEach((e)=> {
    e.addEventListener("click", ()=>{
        pupa.classList.remove("desativado");
        bodya.classList.add("no-scroll");
    })
});
cancelbtna.onclick = () =>{
    pupa.classList.add("desativado");
    bodya.classList.remove("no-scroll");
}

// POP-UP: DENUNCIAR
denun.forEach((e)=> {
    e.addEventListener("click", ()=>{
        options.classList.add("none");
        pupd.classList.remove("desativado");
        bodya.classList.add("no-scroll");
    })
});

cancelbtnd.onclick = () =>{
    t.classList.remove("tw")
    sele.innerHTML = "<div class='t'>Selecione uma categoria</div>"
    pupd.classList.add("desativado");
    bodya.classList.remove("no-scroll");
}

// FAVORITOS
heart.addEventListener("change",()=>{
    formf.submit()
})

// LIKE
like.forEach((e)=>{
    e.addEventListener("change",()=>{
        forml.submit()
    })
})
// MILAGRE
if(pupd.classList.contains("desativado")){
    body.classList.remove("no-scroll")
} else{
    body.classList.add("no-scroll")
}