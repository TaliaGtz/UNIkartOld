const form = document.getElementById('form');
const username = document.getElementById('username');
const password = document.getElementById('password');

form.addEventListener('submit', (e) => {
	e.preventDefault();
	
	validarLogin();
    
});

function validarLogin()
{
        const usernameV = username.value.trim();
        const passwordV = password.value.trim();
        
        if(usernameV === '')
        {
            alert("La celda de username no puede estar en blanco");
        }
        
        if(passwordV === '')
        {
            alert("La celda de password no puede estar en blanco");
        }
}