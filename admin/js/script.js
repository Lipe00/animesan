const pup = document.querySelector(".pup")
const body = document.querySelector("body")
const cancel = document.querySelector("#cancel")
const lix = document.querySelectorAll(".fa-trash-can")

lix.forEach((e)=>{
    e.addEventListener("click",()=>{
        pup.classList.remove("desativado")
        body.classList.add("no-scroll")
    })
})
cancel.onclick = () =>{
    pup.classList.add("desativado")
    body.classList.remove("no-scroll")
}

if(pup.classList.contains("desativado")){
    body.classList.remove("no-scroll")
} else{
    body.classList.add("no-scroll")
}