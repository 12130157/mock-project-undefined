//xem the nao, van chua duoc, buc minh qua
function GetRowValue(valA,valB,valC) {
    window.opener.document.getElementById("abc").value = valA;//code
    window.opener.document.getElementById("xyz").value = valB;//name
    window.opener.document.getElementById("ok").value = valC; //id
    
    
    window.close();
}

window.onload = function() {
    document.getElementById("btnSelect").onclick = null;
};


function ShowLookUp(url) {
    var returnResultArgs = window.showModalDialog(url, "#1", "dialogHeight: 330px; dialogWidth: 700px;" +
                        "dialogTop: 190px;  dialogLeft: 300px; edge: Raised; center: Yes;" +
                        "help: No;resizable: No; status: No;location:No;titlebar:No;");

    return returnResultArgs;
}
  


