<body bgcolor="#fffaf0">
<form method="post">
    <table>

        <tr>
            <td>
                <textarea name="comment" placeholder="Enter your comment here" cols="35" rows="7"></textarea>
            </td>
        </tr>

        <tr>
            <td>
                <input type="text" name="name" placeholder="Enter your name" required>
            </td>
        </tr>

        <tr>
            <td>
                <input type="text" name="address" placeholder="Enter your address">
            </td>
        </tr>

        <tr>
            <td>
                <input type="text" name="email" placeholder="Enter your email">
            </td>
        </tr>

        <tr>
            <td>
                <input type="tel" name="phone" placeholder="Enter your telephone" required>
            </td>
        </tr>

        <tr>
            <td>
                <input type="file" name="file">
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" name="submit">
            </td>
        </tr>
    </table>
</form>
</body>

<?php

if (isset($_POST['submit'])) {

    if ($_POST['name'] == null || $_POST['phone'] == null) echo 'Введите ФИО и телефон'; //повторная проверка обязательных полей

    $email = $_POST['email'];

    $index = strpos($email, '@');

    $email = substr($email, $index + 1);

    if ($email == 'gmail.com') echo '<p style="color: rgb(255,0,0)"><b>Регистрация пользователей с таким почтовым адресом невозможна!</b></p>';
}