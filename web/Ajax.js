
var requestEx;
function studentExisted()
    {   
        var eS = document.exist.username.value;
        var url = "addExistingS.jsp?eSt=" + eS ;
        if (window.XMLHttpRequest)
        {
            requestEx = new XMLHttpRequest();
        } 
        else if (window.ActiveXObject)
        {
            requestEx = new ActiveXObject("Microsoft.XMLHTTP");
        }
        try
        {
            requestEx.onreadystatechange = getexistS;
            requestEx.open("GET", url, true);
            requestEx.send();
        } 
        catch (e)
        {
            alert("Unable to connect to server");
        }
    }
function getexistS()
    {
        if (requestEx.readyState == 4)
        {
            var val = requestEx.responseText;
            document.getElementById('existingStu').innerHTML = val;
        }
    }

//View Course     
    var requestC;
function sendCourseInfo()
    {
        var vC = document.cdv.cI.value;
        var url = "viewC.jsp?val=" + vC ;
        if (window.XMLHttpRequest)
        {
            requestC = new XMLHttpRequest();
        } 
        else if (window.ActiveXObject)
        {
            requestC = new ActiveXObject("Microsoft.XMLHTTP");
        }
        try
        {
            requestC.onreadystatechange = getCourseInfo;
            requestC.open("GET", url, true);
            requestC.send();
        } 
        catch (e)
        {
            alert("Unable to connect to server");
        }
    }
function getCourseInfo()
    {
        if (requestC.readyState == 4)
        {
            var val = requestC.responseText;
            document.getElementById('cView1').innerHTML = val;
        }
    }
    

var requestA;
function sendFacultyInfoA()
    {
        var v = document.regF.facultyid.value;
        var url = "authAc.jsp?val=" + v ;
        if (window.XMLHttpRequest)
        {
            requestA = new XMLHttpRequest();
        } 
        else if (window.ActiveXObject)
        {
            requestA = new ActiveXObject("Microsoft.XMLHTTP");
        }
        try
        {
            requestA.onreadystatechange = getFacultyInfoA;
            requestA.open("GET", url, true);
            requestA.send();
        } 
        catch (e)
        {
            alert("Unable to connect to server");
        }
    }
function getFacultyInfoA()
    {
        if (requestA.readyState == 4)
        {
            var val = requestA.responseText;
            document.getElementById('Ac').innerHTML = val;
        }
    }

    //Feedback//
    var requestF;
function sendFeedback()
    {
        var email = document.feedb.email.value;
        var comment = document.feedb.comment.value;
        var url = "feedback.jsp?em=" + email + "&com=" + comment ;
        if (window.XMLHttpRequest)
        {
            requestF = new XMLHttpRequest();
        } 
        else if (window.ActiveXObject)
        {
            requestF = new ActiveXObject("Microsoft.XMLHTTP");
        }
        try
        {
            requestF.onreadystatechange = getFeedback;
            requestF.open("GET", url, true);
            requestF.send();
        } 
        catch (e)
        {
            alert("Unable to connect to server");
        }
    }
function getFeedback()
    {
        if (requestF.readyState == 4)
        {
            var val = requestF.responseText;
            document.getElementById('feedba').innerHTML = val;
        }
    }
    //Feedback//
    
        //Fee Update//
    var requestU;
function updateFeeS()
    {
        var stF = document.upFe.facultyid.value;
        var url = "updateFee.jsp?em=" + stF ;
        if (window.XMLHttpRequest)
        {
            requestU = new XMLHttpRequest();
        } 
        else if (window.ActiveXObject)
        {
            requestU = new ActiveXObject("Microsoft.XMLHTTP");
        }
        try
        {
            requestU.onreadystatechange = getFee;
            requestU.open("GET", url, true);
            requestU.send();
        } 
        catch (e)
        {
            alert("Unable to connect to server");
        }
    }
function getFee()
    {
        if (requestU.readyState == 4)
        {
            var val = requestU.responseText;
            document.getElementById('uFe').innerHTML = val;
        }
    }
    
    