Position_CM := (Pi * Diametr_vala * TO_REAL (func_1_Position_INC1)) / 1450.0;

// 3. В первую позицию записываем текущее значение
    MyArrayOfStruct[0].Position_CM := Position_CM;     
        
    MyArrayOfStruct[0].Recording_time := Date_Time_convert(RTC); //выводим время  
    
    
     Reset_out:= FALSE;
IF MyArrayOfStruct[0].Cell_status THEN
     
    // 2. Сдвигаем все элементы вниз (начиная с конца!)
    FOR j := UPPER_BOUND(MyArrayOfStruct, 1) // 1. Находим верхнюю границу массива один раз
            TO 1 BY -1 DO
        MyArrayOfStruct[j]:= MyArrayOfStruct[j-1];
        
    END_FOR;
            
   Reset_out:= TRUE;   
    // если нужно заполнить и другие поля структуры:
   
       // 4. Опционально: сбросить флаг после выполнения (одноразовое действие)
    MyArrayOfStruct[0].Cell_status := FALSE;
    MyArrayOfStruct[0].Position_CM := 0;
END_IF;

//проверка заполненного поля с галочкой

  FOR
    A:= 1 TO UPPER_BOUND(MyArrayOfStruct, 1) DO 
    if MyArrayOfStruct[A].Cell_status THEN
     //   A:= A+1;
        ELSE 
             FOR B:=A TO UPPER_BOUND(MyArrayOfStruct, 1) -1 DO
             MyArrayOfStruct[B]:= MyArrayOfStruct[B+1];
             END_FOR
        MyArrayOfStruct[UPPER_BOUND(MyArrayOfStruct, 1)].Cell_status:= FALSE;
                MyArrayOfStruct[UPPER_BOUND(MyArrayOfStruct, 1)].Recording_time:='';
                        MyArrayOfStruct[UPPER_BOUND(MyArrayOfStruct, 1)].Position_CM:=0 ;
    END_IF
    END_FOR



