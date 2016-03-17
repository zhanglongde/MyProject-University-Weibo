
$("#personInfSet").click(function () {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    window.location.href = "personInfSet.aspx?username=" + userName;

});
$(".comcernfan").click(function () {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    window.location.href = "comcernfan.aspx?username=" + userName;

});
$("#exit").click(function () {
    window.location.href = 'weiboLoginPage.aspx';

});
$("#superfisnHome").click(function () {
    var userName = getUserName();
    window.location.href = "weiHomepage.htm?username=" + userName;

});

$("#fansLink").click(function () {
    $("#pl_relation_fans").css("display", "block");
    $("#pl_relation_follow").css("display", "none");
    var userName = getUserName();
    load4fans(userName);
});
$("#concernsLink").click(function () {
    $("#pl_relation_fans").css("display", "none");
    $("#pl_relation_follow").css("display", "block");
});
$("#allConcernsLink").click(function () {
    $("#pl_relation_fans").css("display", "none");
    $("#pl_relation_follow").css("display", "block");
    var userName = getUserName();
    loadAllConcernsInf(userName);

}); 

$(document).ready(function () {
    $("#pl_relation_follow").css("display", "none");
    menu();
});
function menu() {
    $("ul.sf-vertical").superfish({
        animation: { opacity: 'show', height: 'show' },
        speed: 'fast'
    });
}
function getUserName() {
    var url = document.URL;
    url = url.split("=");
    var userName = decodeURI(url[1]);
    return userName;
}