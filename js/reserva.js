
/* CADASTRO IMOVEL*/
document.getElementById('property-images').addEventListener('change', function (event) {
    const imagePreview = document.getElementById('image-preview');
    imagePreview.innerHTML = ''; // Limpa imagens antigas

    const files = event.target.files;
    for (const file of files) {
        if (file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                imagePreview.appendChild(img);
            };
            reader.readAsDataURL(file);
        }
    }
});




/*login*/

document.addEventListener('DOMContentLoaded', () => {
    const loginIcon = document.getElementById('loginIcon');
    const loginForm = document.getElementById('loginForm');

    // Mostrar o formulário 
    loginIcon.addEventListener('mouseover', () => {
        loginForm.style.display = 'block';
    });

    // Ocultar o formulário 
    loginIcon.addEventListener('mouseleave', () => {
        setTimeout(() => {
            if (!loginForm.matches(':hover')) {
                loginForm.style.display = 'none';
            }
        }, 100);
    });

    // Manter o formulário visível 
    loginForm.addEventListener('mouseover', () => {
        loginForm.style.display = 'block';
    });

    // Ocultar o formulário 
    loginForm.addEventListener('mouseleave', () => {
        loginForm.style.display = 'none';
    });
});


/*cadastro imovel */
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('propertyForm');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        alert('Imóvel cadastrado com sucesso!');
        form.reset();
    });
});
/*reserva */
function calculateTotal() {
    const checkin = new Date(document.getElementById('checkin').value);
    const checkout = new Date(document.getElementById('checkout').value);
    const oneDay = 24 * 60 * 60 * 1000;
    const diffDays = Math.round(Math.abs((checkout - checkin) / oneDay));
    const total = diffDays * 200;

    document.getElementById('total-value').textContent = total > 0 ? total.toFixed(2).replace('.', ',') : "0,00";
}


function showCreditCard(show) {
    const creditCardDetails = document.querySelector('.credit-card-details');
    creditCardDetails.style.display = show ? 'block' : 'none';
}

function finalizeReservation() {
    alert("Reserva realizada com sucesso! Os detalhes foram enviados para o seu e-mail.");
}

