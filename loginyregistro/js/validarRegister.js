
const form = document.getElementById('form');
const names = document.getElementById('names');
const lastnames = document.getElementById('lastnames');
const birthday = document.getElementById('birthday');
const email = document.getElementById('email');
const profileimage = document.getElementById('profileimage');
const username = document.getElementById('username');
const password = document.getElementById('password');
const confirmpassword = document.getElementById('confirmpassword');

form.addEventListener('submit', (e) => {
	e.preventDefault();
	
	validar();
    
});

function validar()
{
        const namesV = names.value.trim();
        const lastnamesV = lastnames.value.trim();
        const birthdayV = birthday.value.trim();
        const emailV = email.value.trim();
        const profileimageV = profileimage.value.trim();
        const usernameV = username.value.trim();
        const passwordV = password.value.trim();
        const confirmpasswordV = confirmpassword.value.trim();
        
        var namesRegex = new RegExp("^[a-zA-ZÀ-ÿ ]+$");
        var fecha = new Date(birthdayV);
        var fechahoy = new Date();
        var strongRegex = new RegExp("^(?=.[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");

        if(namesV === '')
        {
            alert("La celda de names no puede estar en blanco");
        }
        
        if(lastnamesV === '')
        {
            alert("La celda de lastnames no puede estar en blanco");
        }

        if (!namesRegex.test(namesV))
        {
            alert("Escribe bien tu nombre");
        }
        if (!namesRegex.test(lastnamesV))
        {
            alert("Escribe bien tus apellidos");
        }
        
        if(birthdayV === '')
        {
            alert("La celda de birthday no puede estar en blanco");
            
        }
        if(fecha > fechahoy)
        {
            alert("La fecha seleccionada es mayor a la actual favor de cambiarla por una valida");
        }
        
        
        if(emailV === '')
        {
            alert("La celda de email no puede estar en blanco");
        } else if (!isEmail(emailV))
        {
            alert("No es un email valido");
        }

        if(profileimageV === '')
        {
            alert("La celda de profileimage no puede estar en blanco");
        }

        if(usernameV === '')
        {
            alert("La celda de username no puede estar en blanco");
        }

        if(passwordV === '')
        {
            alert("La celda de password no puede estar en blanco");
        }

        if(confirmpasswordV === '')
        {
            alert("La celda de confirmpassword no puede estar en blanco");
        }

        if (!strongRegex.test(passwordV))
        {
            alert("Tu contraseña debe tener: min 8 caracteres, una mayuscula, una minuscula, un numero y un signo de puntuacion");
        }else if (passwordV !== confirmpasswordV)
        {
            alert("Las contraseñas no coinciden");
        }

        
}

function isEmail(email)
{
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}