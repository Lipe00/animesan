var space = document.querySelector("#space")
var btn = document.querySelector("#btn-teste")
var img = document.querySelector("#image-back")

wallpaperChange()

function randomfun(){
   return Math.floor(Math.random() * 3)
}

function wallpaperChange(){
let random = randomfun()
console.log(random)
img.setAttribute('src', "../img/background/anime-"+random+".jpg")

}

