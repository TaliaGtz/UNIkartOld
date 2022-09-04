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
    icon.setAttribute('src', '../ExtraDocs/Soup.png');
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
    name.textContent = "Nombre del producto";
    divisor.appendChild(name);

    var msgRB = document.createElement('p');
    msgRB.textContent = "Descripción";
    divisor.appendChild(msgRB);

    var msgRB = document.createElement('p');
    msgRB.textContent = "precio/a negociar";
    divisor.appendChild(msgRB);
    
    msg = document.createElement('p');
    msg.textContent = "Media(img,mp4)";
    divisor.appendChild(msg);

    var view = document.createElement('a');
    view.setAttribute('id', 'arrow');
    view.setAttribute('href', '../Producto/Producto.html');
    divisor.appendChild(view);

    var arrow = document.createElement('i');
    arrow.setAttribute('id', 'view');
    arrow.setAttribute('class', 'fa-solid fa-circle-chevron-right');
    view.appendChild(arrow);

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
});

$("#eliminar").click(function(){
    j = j + 1;
    $("#article" + j).remove();       //Quita todo el código que tenga que ver con la lista
});