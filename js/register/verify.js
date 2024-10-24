
var button = document.getElementById("btn-teste")
var btnfinal = document.getElementById("btn-submit")
var username = document.getElementById("username")
var email = document.getElementById("email")
var datan = document.getElementById("data_nasc")
var senha = document.getElementById("password")
var csenha = document.getElementById("confirmpassword")
var errorfield = document.getElementById("error")
var errortext = document.getElementById("error-text")
var form = document.getElementById("form")
var labelnome = document.getElementById("label-nome")
var labelemail = document.getElementById("label-email")
var labeldatan = document.getElementById("label-data")




// username.onblur = function() {
//     label(username, labelnome)
// }
// email.onblur = function() {
//     label(email, labelemail)    
// }
// datan.onblur = function() {
//     label(datan, labeldatan)
//     console.log(labelsenha.classList)
// }



form.addEventListener('submit', () => {
    if(verify()){

    }else{
        event.preventDefault();
    }
})

function label(campo, label){
    if(campo.value == ""){
        label.classList.remove("label-active")
        // console.log("removendo classe")
    }else{
        label.classList.add("label-active")
        // console.log("adicionando classe")
    }
}

function verify(){
if(username.value == ""){
    errorfield.classList.add("alert")
    errortext.innerText = "O campo nome está vazio!"
    return false
}else if(username.value.length < 3){
    errorfield.classList.add("alert")
    errortext.innerText = "O nome de usuário deve ter no mínimo 3 dígitos!"
    return false
}else if(email.value == ""){
    errorfield.classList.add("alert")
    errortext.innerText = "O campo email está vazio!"
    return false
}else if(!validateEmail(email.value)){
    errorfield.classList.add("alert")
    errortext.innerText = "Email inválido!"
    return false
}else if(datan.value == ""){
    errorfield.classList.add("alert")
    errortext.innerText = "O campo data de nascimento está vazio!"
    return false
}else if (datan.value.length < 10){
    errorfield.classList.add("alert")
    errortext.innerText = "Data de nascimento incorreta!"
    return false
}else if(senha.value == ""){
    errorfield.classList.add("alert")
    errortext.innerText = "O campo senha está vazio!"
    return false
}else if(senha.value.length < 8){
    errorfield.classList.add("alert")
    errortext.innerText = "A senha deve ter no mínimo 8 dígitos!"
    return false
}else if(csenha.value != senha.value ){
    errorfield.classList.add("alert")
    errortext.innerText = "As senhas não são iguais!"
    return false
}else{
    errorfield.classList.remove("alert")
    errortext.innerText = ""
    return true
}

}


// INICIO CODS DATA N
datan.addEventListener('keypress', (e)=> {
    const keyCode = (e.keyCode ? e.keyCode : e.which);
    let datalength = datan.value.length
    if(datalength == "2" || datalength == "5"){
        if(keyCode == "47"){
        }else{
            datan.value += "/"
        }

    }
})
datan.addEventListener('keypress', (e) => {
    if(!checkChar(e)){
        e.preventDefault();
    }
}
)
// FIM DATA N 


// button.onclick = function(){
//     console.log(validateEmail(email.value))
//     // console.log("xd")

// }

function validateEmail(email){
    var re = /\S+@\S+\.\S+/;
    return re.test(email)
}

function checkChar(e){
    const char = String.fromCharCode(e.keyCode);
    const pattern = '[0-9()-./ ]'
    if(char.match(pattern)){
        return true;
    }else{
    }
}

//ERROS

function verifyErrors(field){
    let foundError = false;

    for(let error in field.validity){
        //se não for custom error
        //então ele verifica se tem erro
        if (error != "customError" && field.validity[error]){
            foundError = error
        }
    }
    return foundError

}

//ERROS