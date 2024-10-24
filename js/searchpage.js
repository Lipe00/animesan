const gx = document.querySelectorAll("#gx")
const sgen = document.querySelector("#sgen")
const gens = document.querySelector("#gens")
const geni = document.querySelectorAll(".geni")
const geno = document.querySelector(".geno")
const gb = document.querySelector("#gb")
const gxi = document.querySelector("#gxi")
const sx = document.querySelector("#sx")
const se = document.querySelector("#se")
const bo = document.querySelector("#bo")
const opa = document.querySelector("#opa")
const opm = document.querySelector("#opm")
const opmo = document.querySelectorAll(".opmo")
const arrow = document.querySelector("#arrow")
const formG = document.querySelector("#formGen")
const formO = document.querySelector("#formOrder")
const teste = document.querySelector(".thetest")

// PESQUISA
// sx.onclick = ()=>{
//     se.classList.add("none")
// }
// GENEROS
teste.onclick = ()=>{
    gens.classList.remove("none");
}
geni.forEach((e)=> {
    e.addEventListener("click", ()=>{
        gb.innerHTML = e.querySelector("label").innerHTML
        gens.classList.add("none")
        gxi.classList.remove("nonei")
        // formG.submit()

    })
});
gx.forEach((e)=>{
    e.addEventListener("click", ()=>{
        gb.innerHTML = '<div class="des">Nenhum selecionado</div>'
        gxi.classList.add("nonei")
    })
})
// BUSCAR
opa.addEventListener("click",() =>{
    opm.classList.toggle("none")
    arrow.classList.toggle("rotate")
})
opmo.forEach((e)=> {
    e.addEventListener("click", ()=>{
        bo.innerHTML = e.querySelector("label").innerHTML
        opm.classList.add("none")
        arrow.classList.remove("rotate")
    })
});

// cell
const gxC = document.querySelectorAll("#gxC")
const sgenC = document.querySelector("#sgenC")
const gensC = document.querySelector("#gensC")
const geniC = document.querySelectorAll(".geniC")
const genoC = document.querySelector(".genoC")
const gbC = document.querySelector("#gbC")
const gxiC = document.querySelector("#gxiC")
const sxC = document.querySelector("#sxC")
const seC = document.querySelector("#seC")
// a
const boC = document.querySelector("#boC")
const opaC = document.querySelector("#opaC")
const opmC = document.querySelector("#opmC")
const opmoC = document.querySelectorAll(".opmo")
const arrowC = document.querySelector("#arrowC")
const formGC = document.querySelector("#formGenC")
const formOC = document.querySelector("#formOrderC")

const testeC = document.querySelector(".thetestC")

// PESQUISA
// sx.onclick = ()=>{
//     se.classList.add("none")
// }
// GENEROS
testeC.onclick = ()=>{
    gensC.classList.remove("none");
}
geniC.forEach((e)=> {
    e.addEventListener("click", ()=>{
        gbC.innerHTML = e.querySelector("label").innerHTML
        gensC.classList.add("none")
        gxiC.classList.remove("nonei")
        // formG.submit()

    })
});
gxC.forEach((e)=>{
    e.addEventListener("click", ()=>{
        gbC.innerHTML = '<div class="des">Nenhum selecionado</div>'
        gxiC.classList.add("nonei")
    })
})
// BUSCAR
opaC.addEventListener("click",() =>{
    opmC.classList.toggle("none")
    arrowC.classList.toggle("rotate")
})
opmoC.forEach((e)=> {
    e.addEventListener("click", ()=>{
        boC.innerHTML = e.querySelector("label").innerHTML
        opmC.classList.add("none")
        arrowC.classList.remove("rotate")
    })
});
