<form method="post">
    <input type="text" placeholder="Enter arithmetic expression" name="math" required>
    <input type="submit" name="submit">
</form>

<?php

if (isset($_POST['submit'])){

    $input_str = $_POST['math'];
    $copy_str = $input_str; //доп. переменная, чтобы в ходе обработки строки не изменились исходные данные

    $brackets_arr = array();

    $error = false;

    $k = 0;

    if (strlen($copy_str) == 1 && ($copy_str[0] == '(' || $copy_str[0] == ')')) { //проверка на строку, состоящую из одной скобки

        echo '<p style="color: red"><b>Check count of brackets at your expression!</b></p>';

        $error = true;

        exit();
    }

    for ($i = 0; $i < strlen($copy_str); $i++){ //поиск открывающей скобки

        if ($copy_str[$i] == '(') {

            $brackets_arr[$k] = $copy_str[$i];

            $k++;

            for ($j = $i + 1; $j < strlen($copy_str); $j++){ //поиск парной закрывающей скобки

                if ($copy_str[$j] == ')') {

                    $brackets_arr[$k] = ')';

                    $copy_str[$j] = '.';

                    $k++;

                    break;
                }

                if ($j == strlen($copy_str) - 1 && count($brackets_arr) % 2 != 0) $error = true; //проверка на кол-во найденных скобок
            }
        }

        if ($copy_str[$i] == ')') $error = true; //проверка на наличие закрывающей скобки, стоящей перед открывающей

        if ($error) {

            echo '<p style="color: red"><b>Check count of brackets at your expression!</b></p>';

            break;
        }

        $brackets_arr = array(); //обнуление массива для работы с парами скобок
    }

    if (!$error) echo 'Everything alright!';
}