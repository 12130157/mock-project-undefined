 function OpenModelPopup()
    { 
//        document.getElementById ('tdDisplayName').innerHTML='';
//        document.getElementById ('txtName').value='';
        document.getElementById ('ModalPopupDiv').style.visibility='visible';
        document.getElementById ('ModalPopupDiv').style.display='';
        document.getElementById ('ModalPopupDiv').style.top= 200+ 'px';
        document.getElementById ('ModalPopupDiv').style.left= Math.round((window.innerWidth/2)-250) + 'px';
//        document.getElementById ('ModalPopupDiv').style.left='400px';
        
        document.getElementById ('MaskedDiv').style.display='';
        document.getElementById ('MaskedDiv').style.visibility='visible';
        document.getElementById ('MaskedDiv').style.top='0px';
        document.getElementById ('MaskedDiv').style.left='0px';
        document.getElementById ('MaskedDiv').style.width=  document.documentElement.clientWidth + 'px';
        document.getElementById ('MaskedDiv').style.height= document.documentElement.clientHeight+ 'px';
    }
    function CloseModelPopup()
    {
        document.getElementById ('MaskedDiv').style.display='none';
        document.getElementById ('ModalPopupDiv').style.display='none';
    }
     function Submit()
    {
        if(document.getElementById ('txtName').value!='')
        {
            document.getElementById ('MaskedDiv').style.display='none';
            document.getElementById ('ModalPopupDiv').style.display='none';
            document.getElementById ('tdDisplayName').innerHTML='<H1> Hi ' + document.getElementById ('txtName').value +' !</H1>';
        }
        else 
        {
            alert ('Please enter your name');
        }
    }