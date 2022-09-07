function validarespacios()
{
  names = document.getElementById("names").value;
  lastnames = document.getElementById("lastnames").value;
  birthday = document.getElementById("birthday").value;
  email = document.getElementById("email").value;
  profilepicture = document.getElementById("profilepicture").value;
  username = document.getElementById("username").value;
  password = document.getElementById("password").value;
  confirmpassword = document.getElementById("confirmpassword").value;
  tipo_de_usuario = document.getElementById("tipo_de_usuario").value;

if(names.leght==0 || /^\s+$/.test(names)){
alert("Inserte nombre");
}

if(lastnames.leght==0 || /^\s+$/.test(lastnames)){
  alert("Inserte apellidos");
  }

if(birthday.leght==0 || /^\s+$/.test(birthday)){
  alert("Inserte día de nacimiento");
  }

if(email.leght==0 || /^\s+$/.test(email)){
    alert("Inserte correo electrónico");
    }
  




}