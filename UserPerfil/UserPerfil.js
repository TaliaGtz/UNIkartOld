const navToggle = document.querySelector(".nav-toggle");
const navMenu = document.querySelector(".nav-menu");
var num = 2;
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
        document.getElementById("navList").style = "display: flex";
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

////////////////////////////////////////////////////////////////

var reader;
var input2;
var texto;
//var alm;
function readURL(input) {
    input2 = input;
    if (input.files && input.files[0]) { //Revisamos que el input tenga contenido
      reader = new FileReader(); //Leemos el contenido
      
      reader.onload = function(e) { //Al cargar el contenido lo pasamos como atributo de la imagen de arriba
        $('#image').attr('src', e.target.result);
        
      }
      
      reader.readAsDataURL(input.files[0]);
    }
}
  
$("#userPic").change(function() { //Cuando el input cambie (se cargue un nuevo archivo) se va a ejecutar de nuevo el cambio de imagen y se verá reflejado.
    console.log("sfd");
    readURL(this);
});

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
    document.getElementById('modal-back').onclick = function(){ borrar('modal'); }
}

/*Cart*/
$("#cart").click(function(){
    Modal('Carrito de compras', 
    '<div class="user">'+
        '<img src="../ExtraDocs/Soup.png" height="70" width="70" id="image" alt="Imagen" class="file">'+
        '<p class="productName">Producto</p>'+
        '<i class="fa-solid fa-square-minus quantity"></i>'+
        '<p class="quantityNum">1</p>'+
        '<i class="fa-solid fa-square-plus quantity"></i>'+
    '</div>'+
    '<div class="user">'+
        '<img src="../ExtraDocs/Soup.png" height="70" width="70" id="image" alt="Imagen" class="file">'+
        '<p class="productName">Producto</p>'+
        '<i class="fa-solid fa-square-minus quantity"></i>'+
        '<p class="quantityNum">1</p>'+
        '<i class="fa-solid fa-square-plus quantity"></i>'+
    '</div>',   
    'Cerrar');
});

function addCart(){
    Modal('Carrito de compras', 
    '<div class="user">'+
        '<img src="../ExtraDocs/Soup.png" height="70" width="70" id="image" alt="Imagen" class="file">'+
        '<p class="productName">Producto</p>'+
        '<i class="fa-solid fa-square-minus quantity"></i>'+
        '<p class="quantityNum">1</p>'+
        '<i class="fa-solid fa-square-plus quantity"></i>'+
    '</div>'+
    '<div class="user">'+
        '<img src="../ExtraDocs/Soup.png" height="70" width="70" id="image" alt="Imagen" class="file">'+
        '<p class="productName">Producto</p>'+
        '<i class="fa-solid fa-square-minus quantity"></i>'+
        '<p class="quantityNum">1</p>'+
        '<i class="fa-solid fa-square-plus quantity"></i>'+
    '</div>',   
    'Cerrar');
};

/*Modal*/
function borrarModal(id) {
    var elem = document.getElementById(id); 
    return elem.parentNode.removeChild(elem);
}

function Modal(titulo, contenido, idioma) {
    var padre = document.createElement('div');
    padre.id = 'modal';
    document.body.appendChild(padre);
    var bc = idioma ? idioma : 'Aceptar';
    var ModalData = document.getElementById("modal");
    var boton = "";
    ModalData.innerHTML = '<div id="modal-back"></div><div class="newModal"><div id="modal-new"><h3>'
    + titulo +'</h3><form id="mc">'
    + contenido +'</form><div><button id="buy"><a id="buyT" href="../SisPago/SisPago.html">Ir a pagar</a></button></div><div id="modButtons"><a id="mclose" href="#">'
    + '<i id="close" class="fa-solid fa-circle-xmark"></i>' +'</a>' 
    + boton + '</div></div></div>';
    document.querySelector(".newModal").style.height = document.getElementById("mc").offsetHeight + 200 + 'px';
    document.getElementById('mclose').onclick = function(){ 
        borrarModal('modal'); 
    };
    document.getElementById('modal-back').onclick = function(){ 
        borrarModal('modal'); 
    }
}