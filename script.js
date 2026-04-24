// Sidebar tool switcher
document.querySelectorAll('.tool-item:not(.soon)').forEach(btn => {
  btn.addEventListener('click', () => {
    document.querySelectorAll('.tool-item').forEach(i => i.classList.remove('active'));
    document.querySelectorAll('.tool-panel').forEach(p => p.classList.remove('active'));
    btn.classList.add('active');
    const panel = document.getElementById('panel-' + btn.dataset.tool);
    if (panel) panel.classList.add('active');
  });
});

document.querySelectorAll('.tool-item.soon').forEach(btn => {
  btn.addEventListener('click', () => {
    document.querySelectorAll('.tool-item').forEach(i => i.classList.remove('active'));
    document.querySelectorAll('.tool-panel').forEach(p => p.classList.remove('active'));
    btn.classList.add('active');
    document.getElementById('panel-soon').classList.add('active');
  });
});

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
