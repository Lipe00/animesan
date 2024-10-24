var seta = document.querySelector("#seta-infos")
var columns = document.querySelector("#infos-column")
var setacount = 0
var sinopseTitle = document.querySelector("#sinopse-title")
// seta.addEventListener('click', () => {
//     alert("a")
// })
seta.onclick= function(){
    if(setacount == "0"){
        setacount = 1;
        columns.classList.remove("infos-off")
        sinopseTitle.classList.add("sinopse-margin")
        seta.classList.remove("fa-chevron-down")
        seta.classList.add("fa-chevron-up")
        
        console.log("abrindo informações, virando seta pra cima")
    }else if(setacount == "1"){
        setacount = 0;
        columns.classList.add("infos-off")
        sinopseTitle.classList.remove("sinopse-margin")
        seta.classList.remove("fa-chevron-up")
        seta.classList.add("fa-chevron-down")

        console.log("fechando informações, virando seta pra baixo")
    }
}