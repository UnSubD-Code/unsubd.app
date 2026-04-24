const form = document.getElementById('email-form');
const success = document.getElementById('success');

form.addEventListener('submit', async (e) => {
  e.preventDefault();
  const btn = form.querySelector('button');
  btn.textContent = 'Sending...';
  btn.disabled = true;

  try {
    const res = await fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
      headers: { 'Accept': 'application/json' }
    });

    if (res.ok) {
      form.style.display = 'none';
      success.classList.add('show');
    } else {
      btn.textContent = 'Try again';
      btn.disabled = false;
    }
  } catch {
    btn.textContent = 'Try again';
    btn.disabled = false;
  }
});
