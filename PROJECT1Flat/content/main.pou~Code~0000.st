PROGRAM RulerLogic
VAR
    x1, y1, x2, y2 : INT;       // Координаты из HMI
    distancePx : REAL;          // Внутренний расчет
    distanceCm : REAL;          // Итоговый вывод
    scaleFactor : REAL := 38.0; // Твое значение по умолчанию
END_VAR

// Расчет (выполняется каждый цикл)
distancePx := SQRT(EXPT(TO_REAL(x2 - x1), 2) + EXPT(TO_REAL(y2 - y1), 2));

// Проверка, чтобы не было деления на ноль, если кто-то случайно удалил масштаб
IF scaleFactor > 0.0 THEN
    distanceCm := distancePx / scaleFactor;
ELSE
    distanceCm := 0.0;
END_IF;