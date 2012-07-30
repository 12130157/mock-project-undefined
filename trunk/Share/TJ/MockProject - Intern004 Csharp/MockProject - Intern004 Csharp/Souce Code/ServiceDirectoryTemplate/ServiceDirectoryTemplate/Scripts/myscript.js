function IsFormatDate(temp)
{
        //  dd/mm/yyyy
		var tomach=/^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/;
		return tomach.test(temp);
}
function  IsDate(_date)
{
	if(formDate(_date)) {var temp=_date.split('/');}
	else {return false;}
	if(temp.length >1)
	{
	var dayobj = new Date(temp[2], temp[1]-1, temp[0]);
	if ((dayobj.getMonth()+1!=temp[1])||(dayobj.getDate()!=temp[0])||(dayobj.getFullYear()!=temp[2]))
	return false;
	else return true;
	}
}
function ValidMoneyField(value) {
    if(!value) return true;
	if(value.length<0||value.length>12) return false;
	return /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(value)&&value<=999999999.99;
}
function GetDateObj(value){
	// dd/mm/yyyy
	var _date=value.split('/');
	return new Date(_date[2], _date[1]-1, _date[0]);
}
function AddDate(value, monthToAdd, yearToAdd){
	var _date=GetDateObj(value);
	var newDate= new Date(_date.getTime()+24*60*60*1000*30*monthToAdd+24*60*60*1000*365*yearToAdd);
    return newDate.getDate()+"/"+(newDate.getMonth()+1)+"/"+newDate.getFullYear();
}
function IsDateBefore(value, param) {
    if(!value||!param) return false;
    var date1=new Date();
	var date2=new Date();
    var _value=value.split("/");
	date1.setFullYear(_value[2],_value[1]-1,_value[0]);
	var _param=param.split("/");
	date2.setFullYear(_param[2],_param[1]-1,_param[0]);
    return date1>=date2;
}
function DiffDate(value1, value2) {
    var date1=new Date();
    var date2 = new Date();
    var One_Day=1000*60*60*24
    var _value1=value1.split("/");
    date1.setFullYear(_value1[2],_value1[1]-1,_value1[0]);
	var _value2=value2.split("/");
	date2.setFullYear(_value2[2], _value2[1] - 1, _value2[0]);
    return Math.floor((date1.getTime()-date2.getTime())/One_Day);
}
function IsDateAfter(value, param){
    var date1=new Date();
	var date2=new Date();
    var _value=value.split("/");
	date1.setFullYear(_value[2],_value[1]-1,_value[0]);
	var _param=param.split("/");
	date2.setFullYear(_param[2],_param[1]-1,_param[0]);
    return date1<=date2;
}
function GetToday(){
	var date=new Date();
	return date.getDate()+"/"+(date.getMonth()+1)+"/"+date.getFullYear();
}
function ServiceHiddenTabs(value) {
    switch(value){
        case "Contract": {
            $("#contract-tab").css("display", "inline");
            $("#funding-tab").css("display", "none");
            break;
        }
        case "Funded": {
            $("#contract-tab").css("display", "none");
            $("#funding-tab").css("display", "inline");
            break;
        }
        default: {
            $("#contract-tab").css("display", "none");
            $("#funding-tab").css("display", "none");
        }
    }
}
function OpenPopup(link, functionCallAfterClose, paramList) {
    var win = window.open(link, 'mywindow', 'width=800,height=450,scrollbars=yes,resizable=no');
    if(functionCallAfterClose==null||functionCallAfterClose=="") return;
    var timer = window.setInterval(function () {
        if (win.closed) {
            clearInterval(timer);
            if (paramList != null) {
                var para = "[";
                for (i = 0; i < paramList.length; i++) {
                    para += "'" + paramList[i] + "',";
                }
                para += "null]";
                eval(functionCallAfterClose + '(' + para + ');');
            }
            else { eval(functionCallAfterClose + '();'); window.clearInterval(timer);}
        }
    }, 100);
}
// htmlTag: id or class of html-tag to contain data return from server. 
// eg: "#contain" for id, ".contain" for class 
// eg: AjaxPaging('/Service/List','.container-left');
function AjaxPaging(urlRequest, htmlTag, frm, page) {
    loading(htmlTag);
    //alert(frm.page.value);
    if (!frm || urlRequest == "" || htmlTag == "") {
        alert("Can't find information to paging");
        loaded(htmlTag);
        return;
    }
    page = (page < 1 ? 1 : page);
    page = (page >= frm.totalpage.value ? frm.totalpage.value : page);
//    if (frm.page.value == page) { 
//        loaded();
//        return;
    //    }
    //alert('http://localhost:1375'+urlRequest+'\npage='+page+'\nfilter='+frm.filter.value+'\ninclude='+frm.include.value);
    $.ajax({
		url: urlRequest,
		type: "POST",
		data: ( {page: page, filter:frm.filter.value, include:frm.include.value}),
		dataType: "html",
		success: function(data){
            $(htmlTag).html(data);loaded(htmlTag);
		},
		error: function(xhr, status){
			alert('Reqest server error\n'+status+': '+xhr.statusText);loaded(htmlTag);
		}
    });    
    //$.post(urlRequest, {page: page, filter:frm.filter.value, include:frm.include.value}, function(data) {
        //$(htmlTag).html(data);loaded();
    //});
}
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}
function loading(str) {
    $(".loading-"+str.replace("#","").replace(".","")).fadeIn(10);
}
function loaded(str) { 
    $(".loading-"+str.replace("#","").replace(".","")).fadeOut(10);

}
function ManagerLookUp(FormName, IdTag, NameTag) {
     window.open("/RefData/LookupAddr?FormName=" + FormName + "&IdTag=" + IdTag + "&NameTag=" + NameTag, 'Manager', 'width=800,height=450,scrollbars=yes,resizable=no,top=200,left=200');
}
function AddrLookUp(FormName, IdTag, NameTag) {
    window.open("/Contact/List?TagId=" + IdTag + "&TagName=" + NameTag, 'Address', 'width=800,height=450,scrollbars=yes,resizable=no');
    //window.open("/Organisation/List", 'Address', 'width=800,height=450');
}
function SICLookUp(IdTag, NameTag) {
    window.open("/SICCode/List?TagCode="+IdTag+"&TagName="+NameTag, 'SICCode', 'width=800,height=600,scrollbars=yes,resizable=no');
}
function PostCodeLookUp(TagCode, TagAddr1, TagTown, TagCounty, TagCountry, FunctionCallBack) {
    var win=window.open("/Address/List?TagCode=" + TagCode + "&TagAddr1=" + TagAddr1 + "&TagTown=" + TagTown + "&TagCounty=" + TagCounty + "&TagCountry=" + TagCountry, 'SICCode', 'width=800,height=600,scrollbars=yes,resizable=no');
    var timer = window.setInterval(function () {
        if (FunctionCallBack == undefined)
            window.clearInterval(timer);
        if (win.closed) {
            eval(FunctionCallBack + '();');
            window.clearInterval(timer);
        }
    }, 100);
}
function GetSelected(radioObj) {
    if(!radioObj)
        return;
    var radioLength = radioObj.length;
    if (radioLength == undefined)
        if (radioObj.checked)
        { return radioObj.value; }
        else
        { return;} 
	for(var i = 0; i < radioLength; i++) {
		if(radioObj[i].checked) {
		    { return radioObj[i].value;}
		}
    }
	return;
}
function GetTabsSelected() {
    var str = window.location.hash;
    if (!str)
        return undefined;
    var anchor = str.split("#");
    var index = anchor[1].search(/tabs-/);
    if(index==0)
        return str.charAt(6);
    return undefined;
}
function Back(str) {
    history.go(str);
}