window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.type === 'updateHUD') {
        if (data.health !== undefined) {
            document.getElementById('healthValue').textContent = data.health;
        }
        if (data.armor !== undefined) {
            document.getElementById('armorValue').textContent = data.armor;
        }
        if (data.stamina !== undefined) {
            document.getElementById('staminaValue').textContent = `${data.stamina}%`;
        }
        if (data.money !== undefined) {
            document.getElementById('moneyValue').textContent = `$${data.money}`;
        }
    }
});
