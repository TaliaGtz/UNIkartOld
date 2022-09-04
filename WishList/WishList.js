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
        document.getElementById("iBars").classList.add("moveBars");
        document.getElementById("iBars").classList.remove("resetBars");
    }

    if(num == 2){
        document.getElementById("navList").style = "display: none";
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

    var icon = document.createElement('img');
    icon.setAttribute('src', '../ExtraDocs/Menu.png');
    icon.setAttribute('height', '70');
    icon.setAttribute('width', '70');
    icon.setAttribute('id', 'image');
    icon.setAttribute('alt', 'Imagen');
    icon.setAttribute('class', 'file');
    panel.appendChild(icon);

    divisor = document.createElement('div');
    divisor.setAttribute('class', 'contDiv');
    panel.appendChild(divisor);

    var name = document.createElement('h2');
    name.textContent = "Lista" + i;
    divisor.appendChild(name);

    var msgRB = document.createElement('p');
    msgRB.textContent = "categoría";
    divisor.appendChild(msgRB);

    var msgRB = document.createElement('p');
    msgRB.textContent = "privada/pública";
    divisor.appendChild(msgRB);
    
    msg = document.createElement('p');
    msg.textContent = "Descripción";
    divisor.appendChild(msg);

    var view = document.createElement('i');
    view.setAttribute('class', 'fa-solid fa-circle-chevron-right');
    view.setAttribute('id', 'view');
    divisor.appendChild(view);

    var br = document.createElement('br');
    divisor.appendChild(br);

    var hr = document.createElement('hr');
    divisor.appendChild(hr);

    /*
    var datmsg = document.createElement('input');
    datmsg.setAttribute('type', 'date');
    datmsg.setAttribute('id', 'dateID' + i);
    datmsg.setAttribute('class', 'datepkdP');
    //console.log(date);
    datmsg.setAttribute('value', date);
    datmsg.setAttribute('disabled', 'true');
    divisor.appendChild(datmsg);*/

    msj('UNIkart', 'Lista guardada con éxito', 'Cerrar');
});

$("#eliminar").click(function(){
    j = j + 1;
    $("#article" + j).remove();       //Quita todo el código que tenga que ver con la lista
});
/*
$("article" + num).click(function(){

});*/

function borrar(id) {
    var elem = document.getElementById(id); 
    return elem.parentNode.removeChild(elem);
}

function msj(titulo, contenido, idioma) {
var padre = document.createElement('div');
padre.id = 'modal';
document.body.appendChild(padre);
var bc = idioma ? idioma : 'Aceptar';
var ModalData = document.getElementById("modal");
var boton = "";
ModalData.innerHTML = '<div id="modal-back"></div><div class="modal"><div id="modal-c"><h3>'+titulo+'</h3><span id="mc">'+contenido+'</span><div id="buttons"><a id="mclose" href="#">'+bc+'</a>'+boton+'</div></div></div>';
document.querySelector(".modal").style.height = document.getElementById("mc").offsetHeight+100 + 'px';
document.getElementById('mclose').onclick=function(){ borrar('modal'); };
document.getElementById('modal-back').onclick=function(){ borrar('modal'); }
}