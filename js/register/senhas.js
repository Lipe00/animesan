
var camposenha = document.getElementById("password");
var icone = document.getElementById("icon-eye");
var labelsenha = document.getElementById("label-senha")

function label(campo, label){
    if(campo.value == ""){
        label.classList.remove("label-active")
        // console.log("removendo classe")
    }else{
        label.classList.add("label-active")
        // console.log("adicionando classe")
    }
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
    camposenha.onblur = function(){
        label(camposenha, labelsenha)
            if(camposenha.value != ""){

                // console.log("Não precisa desabilitar")
            }else{
                icone.classList.add("icone-deactived")
                // console.log("desabilitando icone")
            }
    }
var campocsenha = document.getElementById("confirmpassword");
var icone1 = document.getElementById("icon-eye-confirm");
var labelcsenha = document.getElementById("label-csenha")

icone1.onclick= function(){
    if(campocsenha.type === 'password'){
        campocsenha.setAttribute("type", "text")

        icone1.classList.remove("fa-eye-slash")
        icone1.classList.add("fa-eye")

        icone1.classList.add("icone-active")

        // console.log("password -> text")
    } else{
        campocsenha.setAttribute("type", "password")
        
        icone1.classList.remove("fa-eye")
        icone1.classList.add("fa-eye-slash")
        
        icone1.classList.remove("icone-active")

        // console.log("text -> password")
    }
}
    campocsenha.onfocus = function(){
        if(campocsenha.onfocus){
            icone1.classList.remove("icone-deactived")
            // console.log("habilitando icone")
        }else if(campocsenha.onblur){
            icone1.classList.add("icone-deactived")
            // console.log("desabilitando icone")
        }
    }
    campocsenha.onblur = function(){
        label(campocsenha, labelcsenha)
            if(campocsenha.value != ""){

                // console.log("Não precisa desabilitar")
            }else{
                icone1.classList.add("icone-deactived")
                // console.log("desabilitando icone")
            }
    }