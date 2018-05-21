function loadDoc(url, cFunction) {
    var xmlhttp;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            cFunction(this);
            
        }
        
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
;

function helper(buttonId) {
    //View Requests
    if (buttonId === 'buttonOne') {
        alert("buttonOne");
    }
    //View Users
    if (buttonId === 'buttonTwo') {
        addSpinner();
        loadDoc("getstudents", viewUsers);
        //setTimeout(function() {removeSpinner();}, 1000);
        
        //alert("buttonTwo");
    }
    //Add a room
    if (buttonId === 'buttonThree') {
        loadDoc("rooms", fblank);
    }
    //Allot a room
    if (buttonId === 'buttonFour') {
        alert("buttonFour");
    }
}
;

function fblank() {
    
};

function viewUsers(xmlhttp) {
    document.getElementById("content").innerHTML = xmlhttp.responseText;
    removeSpinner();
}   
;


function searchUser() {
    addSpinner();
    var queryString = '?name=' + document.getElementById("text-input-id-1").value;
    loadDoc("getstudents"+ queryString, viewUsers);
    setTimeout(function() {removeSpinner();}, 1000);
};



function editUser(username) {
    
    $.ajax({
           url: 'getstudents',
           type: 'GET',
           dataType: 'json',
           data:{"username":username,"edit":"true"},
           success: function(data){
               if (data.isValid) {
                   viewForm();
                   $('#fullname').val(data.fullname);
                   $('#email').val(data.email);
                   $('#role').val(data.role);
                   $('#gender').val(data.gender);
                   $('#phone').val(data.phone);
                   $('#cnp').val(data.cnp);
                   $('#university').val(data.university);
                   $('#studentid').val(data.studentid);
                   $('#yearofstudy').val(data.yearofstudy);
                   
                   $('#birthdate').val(data.birthdate);
                   $('#completeprofile').prop("checked", data.completeprofile);
                   
                   
                   
               }
               else{
                   alert('invalid');
               }
           }
       });
    
    
};

function viewForm() {
    
    $('#usersTable').slideUp(100);
    $('#editForm').slideDown(1500);
    
    
}
function loadEditForm() {
    var element = document.getElementById("userTable");
    element.classList.remove("slds-show");
    element.classList.add("slds-hide");
    console.log("AAABBBA");
}
;

function displaySome() {
    console.log($('#cnp').value);
}

function updateUser() {
    
    $.ajax({
           url: 'getstudents',
           type: 'POST',
           dataType: 'json',
           data: $('#updateUser').serialize(),
           success: function(data){
               if (data.isValid) {
                   helper('buttonTwo');
               }
               else {
                   
               }
            }
        });
}

$(document).ready(function () {
    $('#editStudentLink').click(function (e) {
        e.preventDefault();
        return false;
    });
    
    $('#editStudentLink').click(function(){
       
       return false;
    });
    
   /** $('#updateUser').submit(function(){
        console.log('ASDASDA');
        alert('')
       $.ajax({
           url: 'getstudents',
           type: 'POST',
           dataType: 'json',
           data: $('updateUser').serialize(),
           success: function(data){
               if (data.isValid) {
                   alert('valid');
               }
               else {
                   
               }
            }
        });
        return false; 
    });*/
});

function addSpinner() {
    var element = document.getElementById("spinnerDiv");
    element.classList.remove("slds-hide");
    element.classList.add("slds-show");
}
;

function removeSpinner() {
    var element = document.getElementById("spinnerDiv");
    element.classList.remove("slds-show");
    element.classList.add("slds-hide");
}
;





