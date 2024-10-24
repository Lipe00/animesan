// POP-UP: BANNER
const banner = document.getElementById("bannerDiv");
const pupb = document.getElementById("pupb");
const cancelbtnb = document.getElementById("cancelbtnb");
const bodym = document.getElementById("body")

banner.onclick = () =>{
    pupb.classList.remove("desativado");
    bodym.classList.add("no-scroll")
}
cancelbtnb.onclick = () =>{
    pupb.classList.add("desativado");
    bodym.classList.remove("no-scroll")
}

// POP-UP: PROFILE
const profile = document.getElementById("profileDiv");
const pupp = document.getElementById("pupp");
const cancelbtnp = document.getElementById("cancelbtnp");

profile.onclick = () =>{
    pupp.classList.remove("desativado");
    bodym.classList.add("no-scroll")
}
cancelbtnp.onclick = () =>{
    pupp.classList.add("desativado");
    bodym.classList.remove("no-scroll")
}

// INTERFACE
var dadosOpc= document.querySelector("#dados-option")
var favOpc= document.querySelector("#favoritos-option")
var extraOpc= document.querySelector("#extra-option")
var iconDados = document.querySelector('#icon-edit-dados')
var iconSenhas = document.querySelector('#icon-edit-senhas')
var iconSenha = document.querySelector('#icon-eye-senha')
var iconCSenha = document.querySelector('#icon-eye-confirm')
var senhaInp = document.querySelector('#passwordInp')
var csenhaInp = document.querySelector('#confirmpasswordInp')
var emailInp = document.querySelector('#emailInp')
var nomeInp = document.querySelector('#nomeInp')
var dataInp = document.querySelector('#dataInp')
var rowButtons1 = document.querySelector('#row-buttons-1')
var rowButtons2 = document.querySelector('#row-buttons-2')
var submit1 = document.querySelector('#submit-1')
var reset1 = document.querySelector('#reset-1')
var submit2 = document.querySelector('#submit-2')
var reset2 = document.querySelector('#reset-2')

var displayDados= document.querySelector('#display_dados')
var displayFavs= document.querySelector('#display_favoritos')
var displayExtra= document.querySelector('#display_extra')

var checkbox1 = document.querySelector('#check_dados')
var checkbox2 = document.querySelector('#check_senhas')

var iconDados2 = document.querySelector('#icon-edit-dados-2')

var sbmta = document.getElementById('sbmta')


submit1.addEventListener('submit', () =>{
    if(nomeInp.value === ''){
        event.preventDefault();
        // console.log('a')
    } else if(emailInp.value === ''){
        event.preventDefault();
        // console.log('a')
    } else if(senhaInp.value === ''){
        event.preventDefault();
        // console.log('a')
    }else{
        console.log('c')
    }

})

dadosOpc.onclick = ()=> {
    changeSelect(dadosOpc)
    displayDados.classList.remove('desliga-display')
    displayFavs.classList.add('desliga-display')
}
favOpc.onclick = ()=> {
    changeSelect(favOpc)
    displayFavs.classList.remove('desliga-display')
    displayDados.classList.add('desliga-display')
    // console.log("a")
}
// extraOpc.onclick = ()=> {
//     changeSelect(extraOpc)
//     displayExtra.classList.remove('desliga-display')
//     displayDados.classList.add('desliga-display')
//     displayFavs.classList.add('desliga-display')
// }

iconDados.onclick= ()=>{


    iconDados2.classList.remove('icon-off')
    iconDados.classList.add('icon-off')

    rowButtons1.classList.remove('edit-button-off')

    sbmta.removeAttribute('readonly')
    sbmta.classList.remove('input-disabled')

    nomeInp.removeAttribute('readonly')
    nomeInp.classList.remove('input-disabled')
    emailInp.removeAttribute('readonly')
    emailInp.classList.remove('input-disabled')
    senhaInp.removeAttribute('readonly')
    senhaInp.classList.remove('input-disabled')
}

iconDados2.onclick= ()=>{


    iconDados2.classList.add('icon-off')
    iconDados.classList.remove('icon-off')

    rowButtons1.classList.add('edit-button-off')

    sbmta.setAttribute('readonly',"true")
    sbmta.classList.add('input-disabled')

    nomeInp.setAttribute('readonly',"true")
    nomeInp.classList.add('input-disabled')
    emailInp.setAttribute('readonly',"true")
    emailInp.classList.add('input-disabled')
    senhaInp.setAttribute('readonly',"true")
    senhaInp.classList.add('input-disabled')
}




iconSenha.onclick = ()=>{
    if(senhaInp.type === 'password'){
    // console.log("aaaaaaaa")
    senhaInp.setAttribute("type", "text")

    iconSenha.classList.remove("fa-eye-slash")
    iconSenha.classList.add("fa-eye")
} else if (senhaInp.type === 'text'){
    // console.log("bbb")
    senhaInp.setAttribute("type", "password")

    iconSenha.classList.remove("fa-eye")
    iconSenha.classList.add("fa-eye-slash")
}
}
iconCSenha.onclick = ()=>{
    if(csenhaInp.type === 'password'){
    // console.log("aaaaaaaa")
    csenhaInp.setAttribute("type", "text")

    iconCSenha.classList.remove("fa-eye-slash")
    iconCSenha.classList.add("fa-eye")
} else if (csenhaInp.type === 'text'){
    // console.log("bbb")
    csenhaInp.setAttribute("type", "password")

    iconCSenha.classList.remove("fa-eye")
    iconCSenha.classList.add("fa-eye-slash")
}
}


function changeSelect(option){
    dadosOpc.classList.remove("atual");
    favOpc.classList.remove("atual");
    // extraOpc.classList.remove("atual");

    option.classList.add("atual");
}