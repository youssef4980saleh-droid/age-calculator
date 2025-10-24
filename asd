<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Simple Calculator</title>
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: #121212;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .calculator {
      background: #1e1e1e;
      padding: 20px;
      border-radius: 20px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
      width: 300px;
    }

    .display {
      background: #000;
      color: #0f0;
      font-size: 2rem;
      padding: 15px;
      border-radius: 10px;
      text-align: right;
      overflow-x: auto;
    }

    .buttons {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 10px;
      margin-top: 20px;
    }

    button {
      padding: 15px;
      font-size: 1.2rem;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: 0.2s;
    }

    button:hover {
      transform: scale(1.05);
    }

    .operator {
      background: #ff9500;
      color: white;
    }

    .equal {
      background: #34c759;
      color: white;
      grid-column: span 2;
    }

    .clear {
      background: #ff3b30;
      color: white;
    }

    .number {
      background: #2c2c2e;
      color: white;
    }
  </style>
</head>
<body>

  <div class="calculator">
    <div class="display" id="display">0</div>
    <div class="buttons">
      <button class="clear">C</button>
      <button class="operator">/</button>
      <button class="operator">*</button>
      <button class="operator">-</button>

      <button class="number">7</button>
      <button class="number">8</button>
      <button class="number">9</button>
      <button class="operator">+</button>

      <button class="number">4</button>
      <button class="number">5</button>
      <button class="number">6</button>
      <button class="equal">=</button>

      <button class="number">1</button>
      <button class="number">2</button>
      <button class="number">3</button>
      <button class="number">0</button>

      <button class="number">.</button>
    </div>
  </div>

  <script>
    const display = document.getElementById('display');
    const buttons = document.querySelectorAll('button');

    let currentInput = '';
    let resetDisplay = false;

    buttons.forEach(btn => {
      btn.addEventListener('click', () => {
        const value = btn.textContent;

        if (btn.classList.contains('clear')) {
          currentInput = '';
          display.textContent = '0';
        } else if (value === '=') {
          try {
            currentInput = eval(currentInput).toString();
            display.textContent = currentInput;
          } catch {
            display.textContent = 'Error';
            currentInput = '';
          }
        } else {
          if (display.textContent === '0' || resetDisplay) {
            display.textContent = value;
            resetDisplay = false;
          } else {
            display.textContent += value;
          }
          currentInput = display.textContent;
        }
      });
    });
  </script>
</body>
</html>
