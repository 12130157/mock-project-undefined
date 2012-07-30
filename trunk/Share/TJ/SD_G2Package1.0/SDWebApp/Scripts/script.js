function confirm_inactive() {
    if (confirm("Are you sure you want to make this In-Active?") == true)
        return true;
    else
        return false;
}

function confirm_save() {
    if (confirm("Are you sure you want to save?") == true)
        return true;
    else
        return false;
}

function ShowPopUpRole(value, text, linkpage) {
    ReturnResultArgs = window.showModalDialog(linkpage, "#1", "dialogHeight: 240px; dialogWidth: 400px;" +
                        "dialogTop: 390px;  dialogLeft: 400px; edge: Raised; center: Yes;" +
                        "help: No; resizable: No; status: No;");
    document.getElementById(value).value = ReturnResultArgs[0];
    document.getElementById(text).value = ReturnResultArgs[1];
    return true;
}
function ClosePopUp(value, text) {
    var result1 = document.getElementById(value).value;
    var result2 = document.getElementById(text).value;
    var myResultArgs = new Array(result1, result2);
    window.returnValue = myResultArgs;
    window.close();
    return false;
}
function ClosePopUp1() {
    window.close();
    return false;
}
function keypress(e) {
    //Hàm dùng để ngăn người dùng nhập các ký tự khác ký tự số vào TextBox
    var keypressed = null;
    if (window.event) {
        keypressed = window.event.keyCode; //IE
    }
    else {
        keypressed = e.which; //NON-IE, Standard
    }

    if (keypressed < 48 || keypressed > 57) { //CharCode của 0 là 48 (Theo bảng mã ASCII)
        //CharCode của 9 là 57 (Theo bảng mã ASCII)
        if (keypressed == 8 || keypressed == 127) {//Phím Delete và Phím Back
            return;
        }
        return false;
    }
}