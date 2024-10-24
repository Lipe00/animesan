const searchBtn = document.querySelector(".search-btn");
    const cancelBtn = document.querySelector(".cancel-btn");
    const searchBox = document.querySelector(".search-box");
    const searchInp = document.querySelector("input");

    searchBtn.onclick = () =>{
    searchBox.classList.add("active");
        searchInp.classList.add("active");
        cancelBtn.classList.add("active");
        searchBtn.classList.add("active");
    }
    cancelBtn.onclick = () =>{
        searchBox.classList.remove("active");
        searchInp.classList.remove("active");
        cancelBtn.classList.remove("active");
        searchBtn.classList.remove("active");
        setTimeout(limparsearch, 1000);

        
    }
    function limparsearch(){
        searchInp.value = "";
    }