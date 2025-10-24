// نجيب عناصر من الصفحة
const display = document.getElementById('display');
const buttons = document.querySelectorAll('button');

let currentInput = '';  // بيخزن العملية اللي المستخدم بيكتبها

buttons.forEach(btn => {
  btn.addEventListener('click', () => {
    const value = btn.textContent;

    // زرار "C" لمسح كل حاجة
    if (btn.classList.contains('clear')) {
      currentInput = '';
      display.textContent = '0';
    }

    // زرار "=" لحساب النتيجة
    else if (value === '=') {
      try {
        currentInput = eval(currentInput).toString(); // نحسب العملية
        display.textContent = currentInput;
      } catch {
        display.textContent = 'Error'; // لو في خطأ
        currentInput = '';
      }
    }

    // باقي الأزرار (أرقام وعمليات)
    else {
      if (display.textContent === '0') {
        display.textContent = value;
      } else {
        display.textContent += value;
      }
      currentInput = display.textContent;
    }
  });
});
