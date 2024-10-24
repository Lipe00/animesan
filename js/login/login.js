
var camposenha = document.getElementById("password");
var labelsenha = document.getElementById("label-senha");
var labeluser = document.getElementById("label-email");
var icone = document.getElementById("icon-eye");
var campouser = document.getElementById("email")
var form = document.getElementById("form")
var errorfield = document.getElementById("error")
var errortext = document.getElementById("error-text")

form.addEventListener('submit', () => {
    if(verify()){
    }else{
        event.preventDefault();
    }
})
function verify(){
    if(campouser.value == ""){
        errorfield.classList.add("alert")
        errortext.innerText = "O campo email está vazio!"
        return false
    }else if(campouser.value == ""){
        errorfield.classList.add("alert")
        errortext.innerText = "O campo email está vazio!"
        return false
    }else if(camposenha.value == ""){
        errorfield.classList.add("alert")
        errortext.innerText = "O campo senha está vazio!"
        return false
    }else if(camposenha.value.length < 8){
        errorfield.classList.add("alert")
        errortext.innerText = "O campo senha está vazio!"
        return false
    }else{
        return true
    }
}

// function label(campo, label){
//     if(campo.value == ""){
//         label.classList.remove("label-active")
//         console.log("removendo classe")
//     }else{
//         label.classList.add("label-active")
//         console.log("adicionando classe")
//     }
// }
// campouser.onblur = function(){
//     label(campouser, labeluser)
// }

function validateEmail(email){
    var re = /\S+@\S+\.\S+/;
    return re.test(email)
}

icone.onclick= function(){
    if(camposenha.type === 'password'){
        camposenha.setAttribute("type", "text")

        icone.classList.remove("fa-eye-slash")
        icone.classList.add("fa-eye")

        icone.classList.add("icone-active")

        // console.log("password -> text")
    } else{
        camposenha.setAttribute("type", "password")
        
        icone.classList.remove("fa-eye")
        icone.classList.add("fa-eye-slash")
        
        icone.classList.remove("icone-active")

        // console.log("text -> password")
    }
}
    camposenha.onfocus = function(){
        if(camposenha.onfocus){
            icone.classList.remove("icone-deactived")
            // console.log("habilitando icone")
        }else if(camposenha.onblur){
            icone.classList.add("icone-deactived")
            // console.log("desabilitando icone")
        }
    }
    // camposenha.onblur = function(){
    //     label(camposenha, labelsenha)
    //         if(camposenha.value != ""){

    //             console.log("Não precisa desabilitar")
    //         }else{
    //             icone.classList.add("icone-deactived")
    //             console.log("desabilitando icone")
    //         }
    // }

let checkbox = document.getElementById('rememberme');
var labelcheck = document.getElementById("label-check");

checkbox.onclick = function(){


if(checkbox.checked) {
    labelcheck.classList.add("label-checked")
    // console.log("O user marcou o checkbox");
} else {
    labelcheck.classList.remove("label-checked")
    // console.log("O user desmarcou o checkbox");
}
}   