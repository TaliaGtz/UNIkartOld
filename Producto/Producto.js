const navToggle = document.querySelector(".nav-toggle");
const navMenu = document.querySelector(".nav-menu");
var num = 2;
var i = 0;
var j = 0;
navToggle.addEventListener("click", ()=>{
    //navMenu.classList.toggle("nav-menu_visible");
    
    if(num == 1){
        toggle(2);
        num = 2;
        return;
    }
    if(num == 2){
        toggle(1);
        num = 1;
        return;
    }
});

function toggle(num){
    if(num == 1){
        document.getElementById("navList").style = "display: block";
        document.getElementById("regSpBtns").style = "height: 80px";
        document.getElementById("iBars").classList.add("moveBars");
        document.getElementById("iBars").classList.remove("resetBars");
    }

    if(num == 2){
        document.getElementById("navList").style = "display: none";
        document.getElementById("regSpBtns").style = "height: 80px";
        document.getElementById("iBars").classList.add("resetBars");
        document.getElementById("iBars").classList.remove("moveBars");
    }
}

$(window).on("load",function checkPosition(){
    if($(window).width() > 843)
    {
        document.getElementById("navList").removeAttribute("style");
    }
});

$("#publicar").click(function(){
    i = i + 1;
    var html = document.querySelector("#contenido");

    panel = document.createElement('article');
    panel.setAttribute('id', 'article' + i);
    panel.setAttribute('class', 'article');
    panel.setAttribute('style', 'display: block');
    html.appendChild(panel);

    var name = document.createElement('h2');
    name.textContent = "Nombre del producto";
    panel.appendChild(name);

    var msgRB = document.createElement('p');
    msgRB.textContent = "Descripción";
    panel.appendChild(msgRB);

    var msgRB = document.createElement('p');
    msgRB.textContent = "precio/a negociar";
    panel.appendChild(msgRB);
    
    msg = document.createElement('p');
    msg.textContent = "Media(img,mp4)";
    panel.appendChild(msg);
    /*
    var datmsg = document.createElement('input');
    datmsg.setAttribute('type', 'date');
    datmsg.setAttribute('id', 'dateID' + i);
    datmsg.setAttribute('class', 'datepkdP');
    //console.log(date);
    datmsg.setAttribute('value', date);
    datmsg.setAttribute('disabled', 'true');
    panel.appendChild(datmsg);*/
});

$("#eliminar").click(function(){
    j = j + 1;
    $("#article" + j).remove();       //Quita todo el código que tenga que ver con la lista
});